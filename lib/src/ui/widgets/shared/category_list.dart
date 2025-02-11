import 'package:app_focus/app_focus.dart';
import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/content_cubit/content_cubit.dart';
import 'package:nrbtv/src/data/models/content/content_type_list_model.dart';
import 'package:nrbtv/src/ui/widgets/widgets.dart';
import 'package:ui_kit/ui_kit.dart';

class CategoryList extends StatefulWidget {
  const CategoryList(
      {super.key, required this.categoryController, required this.type});

  final VerticalPageViewController categoryController;
  final int type;

  @override
  State<CategoryList> createState() => CategoryListState();
}

class CategoryListState extends State<CategoryList> {
  int? selectedIndex = 0;

  void changeIndex(int index, int categoryId) {
    if (index == selectedIndex) {
      setState(() {
        selectedIndex = null;
      });
      return;
    }
    setState(() {
      selectedIndex = index;
    });
    context.read<ContentCubit>().getContentList(
          ContentType.channel.value,
        );
  }

  @override
  Widget build(BuildContext context) {
    final Status categoryStatus = context.select<ContentCubit, Status>(
      (cubit) => cubit.state.categoryStatus,
    );
    final ContentTypeListModel? categoryList =
        context.select<ContentCubit, ContentTypeListModel?>(
      (cubit) => cubit.state.category,
    );
    final isLoading = categoryStatus == Status.loading ||
        categoryStatus == Status.initial ||
        categoryList == null ||
        categoryList.data!.isEmpty;

    if (isLoading) {
      return const ShimmerList.categoryShimmer(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
      );
    }

    return VerticalPageViewFocus(
      controller: widget.categoryController,
      onFocusChange: (value, controller) {
        setState(() {
          if (!value) return;
          FocusScope.of(context).unfocus();
          controller.onFocusReceived();
        });
      },
      builder: (_, controller) {
        return SizedBox(
          height: 90,
          child: PageView.builder(
            allowImplicitScrolling: false,
            scrollDirection: Axis.vertical,
            controller: controller.pageController,
            itemCount: 1,
            physics: const NeverScrollableScrollPhysics(),
            scrollBehavior: const ScrollBehavior().copyWith(
              overscroll: false,
            ),
            itemBuilder: (context, index) {
              return PageViewFocus(
                infinityCarousel: false,
                focusNode: controller.focusNodes.first,
                pageCount: categoryList.data!.length,
                onEnterPressed: (currentPageIndex, controller) {
                  changeIndex(currentPageIndex,
                      categoryList.data![currentPageIndex].id);
                },
                onFocusChange: (value, controller) {
                  setState(() {
                    if (!value) return;
                    controller.onFocusReceived();
                  });
                },
                onPageChanged: (_) {},
                builder:
                    (context, pageViewController, itemIndex, currentPageIndex) {
                  final bool isSelected =
                      (controller.focusNodes.first.hasFocus &&
                          pageViewController.index.value == itemIndex);

                  final String? key = categoryList
                      .data?[pageViewController.getItemIndex(itemIndex)].title;
                  final video = categoryList.data?[itemIndex].title;

                  if (video == null || key == null || video.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CategoryButton(
                      selection: (
                        isSelected: isSelected,
                        isHovering: selectedIndex == itemIndex
                      ),
                      title: key,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
