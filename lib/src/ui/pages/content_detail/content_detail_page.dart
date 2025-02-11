import 'package:commons/shared/extensions.dart';
import 'package:ensure_visible_when_focused/ensure_visible_when_focused.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/index.dart';

// class ContentDetailPageProvider extends StatelessWidget {
//   const ContentDetailPageProvider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<C>(create: );
//   }
// }

class ContentDetailPage extends StatelessWidget {
  const ContentDetailPage({super.key, required this.video});

  static const path = 'content_detail_page';
  static const name = 'content_detail_page';

  final ContentModel video;

  @override
  Widget build(BuildContext context) {
    return _View(
      video: video,
    );
  }
}

class _View extends StatefulWidget {
  const _View({
    required this.video,
  });

  final ContentModel video;

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  late final ScrollController _controller = ScrollController();

  @override
  void initState() {
    // _init();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ContentModel video = widget.video;

    return AppScaffold(
      hasNavbar: true,
      body: UiImageBackground(
        image: video.images.getThumbnail(),
        child: KeyboardListener(
          focusNode: FocusNode(skipTraversal: true, canRequestFocus: false),
          onKeyEvent: (e) {
            if (e.logicalKey == LogicalKeyboardKey.arrowUp &&
                _controller.hasClients) {
              _controller.animateTo(
                0,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            }
          },
          child: CustomScrollView(
            controller: _controller,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, top: 25),
                  child: _Content(
                    video: video,
                    controller: _controller,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: Margins.vertical24),
            ],
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.video,
    required this.controller,
  });

  final ContentModel video;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double rightPadding = screenWidth * 0.4;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Focus(
          focusNode: FocusNode(),
          child: Text(
            video.title,
            style: TextStyles.h4.copyWith(color: context.uiColors.onSurface),
          ),
        ),
        Margins.vertical20,
        if (video.attributes != null)
          TagsWidget(
            isTv: context.isTv,
            attributes: video.attributes!,
          ),
        Margins.vertical16,
        Margins.vertical20,
        Padding(
          padding: EdgeInsets.only(left: 10, right: rightPadding),
          child: Text(video.description ?? '',
              style: TextStyles.bodySmall
                  .copyWith(color: context.uiColors.surface)),
        ),
        Margins.vertical10,
        _ButtonList(
          video: video,
          controller: controller,
        )
      ],
    );
  }
}

class _ButtonList extends StatefulWidget {
  const _ButtonList({
    required this.video,
    required this.controller,
  });

  final ContentModel video;
  final ScrollController controller;

  @override
  State<_ButtonList> createState() => _ButtonListState();
}

class _ButtonListState extends State<_ButtonList> {
  void runAnimation(bool isSelected, int scrollValue) {
    widget.controller.animateTo(
      isSelected
          ? widget.controller.offset - scrollValue
          : widget.controller.offset + scrollValue,
      duration: Durations.long2,
      curve: Curves.easeInOut,
    );
  }

  late final FocusNode saveBtnFocusNode = FocusNode();
  late final FocusNode playBtnFocusNode = FocusNode();
  late final FocusNode watchTrailerBtnFocusNode = FocusNode();
  late final FocusNode seasonsBtnFocusNode = FocusNode();
  late final FocusNode moreLikeThisFocusNode = FocusNode(
    descendantsAreFocusable: false,
    descendantsAreTraversable: false,
  );

  late final List<FocusNode> nodes = [
    saveBtnFocusNode,
    playBtnFocusNode,
    watchTrailerBtnFocusNode,
    seasonsBtnFocusNode,
  ];

  late final ({Color defaultColor, Color focusedColor}) color = (
    defaultColor: Colors.white,
    focusedColor: context.uiColors.primary,
  );

  @override
  void initState() {
    playBtnFocusNode.requestFocus();
    super.initState();
  }

  late final Iterable<
      ({
        String label,
        void Function(BuildContext context) onPressed,
        String icon,
        bool shouldRender,
        FocusNode focusNode,
      })> _buttonList = [
    (
      focusNode: playBtnFocusNode,
      shouldRender: true,
      icon: Assets.play,
      label: 'Play',
      onPressed: (_) {
        if (!context.read<AppCubit>().state.isAuthenticated) {
          context.read<AppCubit>().showAuthDialog();
          return;
        }
        // if (!context.read<AppCubit>().state.isSubscribed) {
        //   context.pushNamed(SubscribePage.name);
        //   return;
        // }

        context.pushNamed(
          VideoPlayerPage.name,
          extra: {'contentModel': widget.video, 'isTrailer': false},
        );
      }
    ),
    (
      focusNode: watchTrailerBtnFocusNode,
      shouldRender: widget.video.sources?.trailer != null,
      icon: Assets.play,
      label: 'Watch Trailer',
      onPressed: (_) {
        // context.pushNamed(VideoPlayerPage.name, extra: {
        //   "mediaEntity": MediaModel.vod(widget.video),
        //   "isTrailer": true
        // });
      }
    ),
    // (
    //   focusNode: seasonsBtnFocusNode,
    //   shouldRender: widget.video.episodes.isNotEmpty,
    //   icon: Assets.videoPlay,
    //   label: 'Seasons',
    //   onPressed: (_) {
    //     final VodTvDetailsCubit cubit = context.read<VodTvDetailsCubit>();

    //     cubit.setSeasonsSelected();
    //   }
    // )
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Margins.vertical20,
          for (final button in _buttonList)
            if (button.shouldRender)
              EnsureVisibleWhenFocused(
                focusNode: button.focusNode,
                child: FocusTextButton(
                  backgroundColor: (
                    focusedColor: context.uiColors.primary.withOpacity(0.2),
                    defaultColor: Colors.transparent
                  ),
                  linearGradient: context.uiColors.primaryGradient,
                  label: button.label,
                  useDefaultButtonStyle: true,
                  focusNode: button.focusNode,
                  icon: button.icon,
                  onPressed: button.onPressed,
                ),
              ),
        ],
      ),
    );
  }
}
