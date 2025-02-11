import 'package:app_focus/app_focus.dart';
import 'package:nrbtv/src/bloc/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/content_cubit/content_cubit.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/ui/widgets/tv_collection_view.dart';
import 'package:nrbtv/src/ui/widgets/widgets.dart';
import 'package:ui_kit/widgets/app_loading_indicator.dart';

class HomeTvView extends StatefulWidget {
  const HomeTvView({
    super.key,
    required this.controller,
  });

  final ScrollController controller;

  @override
  State<HomeTvView> createState() => HomeTvViewState();
}

class HomeTvViewState extends State<HomeTvView> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        focusNode.requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContentCubit, ContentState>(
      builder: (context, state) {
        final bool isLoading =
            state.homePageContent == null || state.homePageContent!.isEmpty;
        return AnimatedSize(
          duration: Durations.long2,
          curve: Curves.easeInOut,
          child: AnimatedSwitcher(
            duration: Durations.long2,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: isLoading
                ? const AppLoadingIndicator(size: 60)
                : Column(
                    key: const ValueKey('home-content'),
                    children: [
                      VerticalPageViewFocus(
                        controller: VerticalPageViewController(
                          pageCount: state.homePageContent!.length,
                          primaryFocusNode: focusNode,
                        ),
                        onFocusChange: (value, controller) {
                          if (!value) {
                            return;
                          }
                          controller.onFocusReceived();
                        },
                        builder: (context, controller) {
                          return SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.75,
                            child: PageView.builder(
                              allowImplicitScrolling: false,
                              scrollDirection: Axis.vertical,
                              controller: controller.pageController,
                              itemCount: state.homePageContent?.length,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollBehavior: const ScrollBehavior().copyWith(
                                overscroll: false,
                              ),
                              itemBuilder: (context, index) {
                                final Map<String, List<ContentModel>>
                                    collectionModel = state.homePageContent!;

                                final entry =
                                    collectionModel.entries.elementAt(index);

                                return TvCollectionView(
                                  videos: entry.value,
                                  headerTitle: entry.key,
                                  focusNode: controller.focusNodes[index],
                                  onPressed: (context, _) => {},
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
