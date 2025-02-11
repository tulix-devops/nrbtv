import 'package:app_focus/managers/vertical_page_view_controller.dart';
import 'package:app_focus/widgets/vertical_page_view_focus.dart';
import 'package:commons/shared/enums.dart';
import 'package:commons/shared/extensions.dart';
import 'package:nrbtv/src/ui/widgets/live_tv_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:nrbtv/src/bloc/content_cubit/content_cubit.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/index.dart';
import 'package:nrbtv/src/ui/pages/content_detail/content_detail_page.dart';
import 'package:nrbtv/src/ui/pages/vod/phone_widgets/widgets.dart';

class ContentTvView extends StatefulWidget {
  const ContentTvView({super.key, required this.contentType});

  final int contentType;

  @override
  State<ContentTvView> createState() => ContentPageState();
}

class ContentPageState extends State<ContentTvView> {
  final ScrollController rootScrollController = ScrollController();
  final FocusNode _vodFocusNode = FocusNode();
  final FocusNode _categoryFocusNode = FocusNode();
  final FocusNode _buttonFocus = FocusNode();

  late final VerticalPageViewController _categoryController =
      VerticalPageViewController(
    pageCount: 1,
    primaryFocusNode: _categoryFocusNode,
    nextFocusNode: _vodFocusNode,
  );

  late final VerticalPageViewController _vodController =
      VerticalPageViewController(
    pageCount: 1,
    primaryFocusNode: _vodFocusNode,
    previousFocusNode: _categoryFocusNode,
  );
  @override
  initState() {
    super.initState();
    if (mounted) {
      init();
    }
  }

  @override
  void dispose() {
    rootScrollController.dispose();
    _vodFocusNode.dispose();
    _categoryFocusNode.dispose();
    super.dispose();
  }

  void init() async {
    _buttonFocus.requestFocus();
    final cubit = context.read<ContentCubit>();
    await cubit.getCategoryList(widget.contentType);
    if (cubit.state.category?.data == null ||
        cubit.state.category!.data!.isEmpty) return;

    ///TODO REMOVE STATIC AND USE getContentListByCategory
    cubit.getContentList(
      ContentType.channel.value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContentCubit, ContentState>(
      builder: (context, state) {
        final bool isLoading = state.mainPageContent == null ||
            state.mainPageContent!.isEmpty ||
            state.contentStatus == Status.loading ||
            state.contentStatus == Status.initial;
        return CustomScrollView(
          controller: rootScrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  TvHeroSection(
                    rootScrollController: rootScrollController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: isLoading
                        ? const ShimmerList.button(
                            itemCount: 1,
                            scrollDirection: Axis.horizontal,
                          )
                        : _ActionRow(
                            video: state.selectedVideo!,
                            focusNode: _buttonFocus,
                          ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: Margins.vertical20),
            SliverToBoxAdapter(
              child: CategoryList(
                type: widget.contentType,
                categoryController: _categoryController,
              ),
            ),
            SliverToBoxAdapter(
              child: VerticalPageViewFocus(
                controller: _vodController,
                onFocusChange: (value, controller) {
                  if (!value) {
                    return;
                  }
                  FocusScope.of(context).unfocus();

                  controller.onFocusReceived();
                },
                builder: (context, controller) {
                  bool isLive = context.read<AppCubit>().state.currentTab ==
                      BottomBarTab.live;
                  double height = isLive
                      ? MediaQuery.sizeOf(context).height * 0.4
                      : MediaQuery.sizeOf(context).height * 0.75;
                  return SizedBox(
                    height: height,
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
                        if (isLoading) {
                          return const Center(
                            child: ShimmerList.vodCard(
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                            ),
                          );
                        }

                        if (isLive) {
                          return LiveTvPageView(
                              content: state.mainPageContent!,
                              focusNode: controller.focusNodes[index]);
                        }

                        return TvPageView(
                          contentTypeId: widget.contentType,
                          videos: state.mainPageContent ?? [],
                          onPressed: (context, vod) {},
                          onPageChanged: (activeIndex) {
                            if (state.mainPageContent == null ||
                                state.mainPageContent!.isEmpty) {
                              return;
                            }

                            if ((activeIndex >= 0 &&
                                activeIndex < state.mainPageContent!.length)) {
                              context.read<ContentCubit>().setSelectedContent(
                                    state.mainPageContent![activeIndex],
                                  );
                            }
                          },
                          focusNode: controller.focusNodes[index],
                        );
                      },
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}

class _ActionRow extends StatelessWidget {
  const _ActionRow({
    required this.video,
    required this.focusNode,
  });

  final ContentModel video;
  final FocusNode focusNode;
  void _onTap(BuildContext context) {
    context.pushNamed(
      ContentDetailPage.path,
      extra: {
        'content': video,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppButton.primaryRounded(
          label: 'Play',
          focusNode: focusNode,
          gradient: context.uiColors.primaryGradient,
          onPressed: () {
            _onTap(context);
          },
          prefixIcon: (asset: Assets.play, size: 24),
        ),
        Margins.horizontal10,
      ],
    );
  }
}
