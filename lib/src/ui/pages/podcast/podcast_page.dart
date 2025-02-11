import 'package:app_focus/managers/vertical_page_view_controller.dart';
import 'package:app_focus/widgets/page_view_focus.dart';
import 'package:commons/shared/enums.dart';
import 'package:commons/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:nrbtv/src/bloc/content_cubit/content_cubit.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/index.dart';
import 'package:nrbtv/src/ui/pages/content_detail/content_detail_page.dart';
import 'package:nrbtv/src/ui/pages/see_all/see_all_page.dart';

import '../vod/phone_widgets/widgets.dart';

class PodcastPage extends StatefulWidget {
  const PodcastPage({super.key});

  @override
  State<PodcastPage> createState() => _PodcastPageState();
}

class _PodcastPageState extends State<PodcastPage> {
  final ScrollController rootScrollController = ScrollController();
  final FocusNode _buttonFocus = FocusNode();

  @override
  void initState() {
    context.read<ContentCubit>().reset();
    // context
    //     .read<ContentCubit>()
    //     .getPaginatedListById(id: ContentType.podcast.value, limit: 6);
    _buttonFocus.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    rootScrollController.dispose();
    super.dispose();
  }

  late final FocusNode _focusButton = FocusNode();
  late final VerticalPageViewController _channelController =
      VerticalPageViewController(
    pageCount: 1,
    primaryFocusNode: FocusNode(),
    previousFocusNode: _focusButton,
  );

  @override
  Widget build(BuildContext context) {
    return Placeholder();
//     return BlocSelector<
//         ContentCubit,
//         ContentState,
//         ({
//           List<ContentModel> content,
//           Status status,
//           List<ContentModel> mainPageContent,
//         })>(
//       selector: (state) {
//         return (
//           content: state.content,
//           status: state.status,
//           mainPageContent: state.mainPageContent
//         );
//       },
//       builder: (context, state) {
//         final podcast = state.mainPageContent;
//         return AppStatusWidget(
//             status: state.status,
//             loaderWidget: const AppLoadingIndicator(
//               size: 70,
//             ),
//             errorWidget: const Center(
//               child: Text('An error occurred'),
//             ),
//             widget: CustomScrollView(
//               controller: rootScrollController,
//               slivers: [
//                 SliverToBoxAdapter(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TvHeroSection(
//                         rootScrollController: rootScrollController,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20),
//                         child: AppButton.primaryRounded(
//                           focusNode: _buttonFocus,
//                           label: 'Play',
//                           gradient: context.uiColors.primaryGradient,
//                           onPressed: () {
//                             context.pushNamed(
//                               ContentDetailPage.name,
//                               extra: {'content': podcast.first},
//                             );
//                           },
//                           prefixIcon: (asset: Assets.play, size: 24),
//                         ),
//                       ),
//                       Margins.vertical20,
//                       Padding(
//                         padding: const EdgeInsets.only(left: 26),
//                         child: Text(
//                           'Podcasts',
//                           style: TextStyles.h4.copyWith(color: Colors.white),
//                         ),
//                       ),
//                       _ChannelListWidget(
//                         controller: _channelController,
//                         podcasts: podcast,
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ));
//       },
//     );
//   }
// }

// class _ChannelListWidget extends StatefulWidget {
//   const _ChannelListWidget({
//     required this.controller,
//     required this.podcasts,
//     this.viewPortFraction,
//   });

//   final VerticalPageViewController controller;
//   final List<ContentModel> podcasts;
//   final double? viewPortFraction;

//   @override
//   State<_ChannelListWidget> createState() => _ChannelListWidgetState();
// }

// class _ChannelListWidgetState extends State<_ChannelListWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return PageViewFocus(
//       infinityCarousel: false,
//       viewPortFraction: widget.viewPortFraction ?? 0.2,
//       onFocusChange: (value, controller) {
//         setState(() {
//           if (!value) return;

//           controller.onFocusReceived();
//         });
//       },
//       onPageChanged: (activeIndex) {
//         context.read<ContentCubit>().setSelectedContent(
//               widget.podcasts[activeIndex],
//             );
//       },
//       focusNode: widget.controller.primaryFocusNode,
//       pageCount: widget.podcasts.length + 1,
//       onEnterPressed: (currentPageIndex, controller) {
//         if (controller.isLastPage) {
//           _onPressed(context);
//           return;
//         }
//         _onCardPressed(context, widget.podcasts[currentPageIndex]);
//       },
//       builder: (context, controller, itemIndex, currentPageIndex) {
//         final bool isSelected = controller.isLastPage &&
//             controller.index.value == widget.podcasts.length;
//         if (itemIndex == widget.podcasts.length) {
//           if (isSelected) {
//             return AppButton.primary(
//               label: 'See All',
//               onPressed: () {
//                 // print('hello');
//                 // _onPressed(context, widget.videos);
//               },
//               gradient: context.uiColors.primaryGradient,
//             );
//           }
//           return AppButton.secondary(
//             label: 'See All',
//             onPressed: () {
//               // _onPressed(context, widget.videos);
//             },
//           );
//         }
//         final ContentModel podcast =
//             widget.podcasts[controller.getItemIndex(itemIndex)];

//         return AppCard(
//           image: podcast.images.getThumbnail(),
//           isSelected: widget.controller.primaryFocusNode.hasFocus &&
//               controller.index.value == itemIndex,
//           content: const Text(''),
//         );
//         // return UiLiveChannelCard(
//         //   key: ValueKey<String>(podcast),
//         //   channelTitle: '',
//         //   channelThumb: podcast,
//         //   isSelected: widget.controller.primaryFocusNode.hasFocus &&
//         //       controller.index.value == itemIndex,
//         //   isLive: false,
//         //   onPressed: () {
//         //     // _onPressed(context, podcast);
//         //   },
//         // );
//       },
//     );
  }

  // void _onPressed(BuildContext context) {
  //   context.pushNamed(
  //     SeeAllPage.name,
  //     extra: {
  //       'contentCubit': context.read<ContentCubit>(),
  //       'typeId': ContentType.podcast.value,
  //     },
  //   );
  // }

  // void _onCardPressed(BuildContext context, ContentModel content) {
  //   context.pushNamed(
  //     ContentDetailPage.name,
  //     extra: {
  //       'content': content,
  //     },
  //   );
  // }
}
