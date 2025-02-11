import 'package:commons/shared/extensions.dart';
import 'package:ensure_visible_when_focused/ensure_visible_when_focused.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nrbtv/src/bloc/bloc.dart';
import 'package:nrbtv/src/core/core.dart';
import 'package:nrbtv/src/data/data.dart';
import 'package:nrbtv/src/ui/pages/pages.dart';
import 'package:nrbtv/src/ui/pages/vod_tv_details/tv_widgets/widgets.dart';
import 'package:nrbtv/src/ui/widgets/widgets.dart';
import 'package:ui_kit/ui_kit.dart';

class VodTvDetailsPage extends StatelessWidget {
  const VodTvDetailsPage({super.key, required this.video});

  static const path = 'video-library-tv-details';
  static const name = 'video-library-tv-details';

  final VodModel video;

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

  final VodModel video;

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  late final ScrollController _controller = ScrollController();

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

  @override
  void initState() {
    _init();

    super.initState();
  }

  void _init() {
    // Future.microtask(() {
    //   context.read<RelatedVodCubit>().fetchRelatedContent(widget.video.id);
    //   context.read<VodTvDetailsCubit>().reset();
    //   context.read<VodCubit>().reset();
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final VodModel video = widget.video;

    return AppScaffold(
      hasNavbar: true,
      body: UiImageBackground(
        image: video.storage?.record.poster ?? '',
        child: KeyboardListener(
          focusNode: FocusNode(skipTraversal: true, canRequestFocus: false),
          onKeyEvent: (e) {
            if (e.logicalKey == LogicalKeyboardKey.arrowUp &&
                _controller.hasClients &&
                nodes.any((node) => node.hasFocus)) {
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
                    saveBtnFocusNode: saveBtnFocusNode,
                    playBtnFocusNode: playBtnFocusNode,
                    watchTrailerBtnFocusNode: watchTrailerBtnFocusNode,
                    seasonsBtnFocusNode: seasonsBtnFocusNode,
                    moreLikeThisFocusNode: moreLikeThisFocusNode,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: Margins.vertical24),
              if (video.groupedSeasons != null)
                BlocSelector<VodTvDetailsCubit, VodTvDetailsState, bool>(
                  selector: (state) => state.isSeasonBtnSelected,
                  builder: (context, isSeasonBtnSelected) {
                    return SliverToBoxAdapter(
                      child: AnimatedSwitcher(
                        switchInCurve: Curves.easeInOut,
                        switchOutCurve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 200),
                        child: isSeasonBtnSelected
                            ? _SeasonsListView(
                                seasons: video.groupedSeasons!,
                                data: video,
                              )
                            : const SizedBox.shrink(),
                      ),
                    );
                  },
                ),
              const SliverToBoxAdapter(child: Margins.vertical24),
              TvRelatedVideosListView(
                primaryFocusNode: moreLikeThisFocusNode,
              ),
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
    required this.saveBtnFocusNode,
    required this.playBtnFocusNode,
    required this.watchTrailerBtnFocusNode,
    required this.seasonsBtnFocusNode,
    required this.moreLikeThisFocusNode,
  });

  final VodModel video;
  final ScrollController controller;

  final FocusNode saveBtnFocusNode;
  final FocusNode playBtnFocusNode;
  final FocusNode watchTrailerBtnFocusNode;
  final FocusNode seasonsBtnFocusNode;
  final FocusNode moreLikeThisFocusNode;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double rightPadding = screenWidth * 0.6;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          video.title,
          style: TextStyles.h4.white,
        ),
        Margins.vertical20,
        Text('text'),
        // TagsWidget(
        //   isTv: context.isTv,
        //   attributes: ,
        //   tagTitle: 'Tags',
        //   activeTags: video.tags.map((tag) => tag.title).toList(),
        // ),
        // Margins.vertical20,
        // TagsWidget(
        //   isTv: context.isTv,
        //   tagTitle: 'Cast',
        //   activeTags: video.actors.map((actor) => actor.title).toList(),
        // ),
        Margins.vertical20,
        Padding(
          padding: EdgeInsets.only(left: 10, right: rightPadding),
          child: Text(video.description, style: TextStyles.bodySmall),
        ),
        Margins.vertical10,
        _ButtonList(
          video: video,
          controller: controller,
          saveBtnFocusNode: saveBtnFocusNode,
          playBtnFocusNode: playBtnFocusNode,
          watchTrailerBtnFocusNode: watchTrailerBtnFocusNode,
          seasonsBtnFocusNode: seasonsBtnFocusNode,
          moreLikeThisFocusNode: moreLikeThisFocusNode,
        )
      ],
    );
  }
}

class _ButtonList extends StatefulWidget {
  const _ButtonList({
    required this.video,
    required this.controller,
    required this.saveBtnFocusNode,
    required this.playBtnFocusNode,
    required this.watchTrailerBtnFocusNode,
    required this.seasonsBtnFocusNode,
    required this.moreLikeThisFocusNode,
  });

  final VodModel video;
  final ScrollController controller;

  final FocusNode saveBtnFocusNode;
  final FocusNode playBtnFocusNode;
  final FocusNode watchTrailerBtnFocusNode;
  final FocusNode seasonsBtnFocusNode;
  final FocusNode moreLikeThisFocusNode;

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

  late final ({Color defaultColor, Color focusedColor}) color = (
    defaultColor: Colors.white,
    focusedColor: context.uiColors.primary,
  );

  @override
  void initState() {
    widget.playBtnFocusNode.requestFocus();
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
      focusNode: widget.playBtnFocusNode,
      shouldRender: true,
      icon: Assets.play,
      label: 'Play',
      onPressed: (_) {
        // if (!context.read<AppCubit>().state.isAuthenticated) {
        //   context.read<AppCubit>().showAuthDialog();
        //   return;
        // }
        // if (!context.read<AppCubit>().state.isSubscribed) {
        //   context.pushNamed(SubscribePage.name);
        //   return;
        // }
        ////TODO fix this MEDIA MODEL
        context.pushNamed(
          VideoPlayerPage.name,
          extra: {
            "mediaEntity": MediaModel.vod(widget.video),
            "isTrailer": false
          },
        );
      }
    ),
    (
      focusNode: widget.watchTrailerBtnFocusNode,
      shouldRender: widget.video.storage?.record.trailer != null,
      icon: Assets.play,
      label: 'Watch Trailer',
      onPressed: (_) {
        context.pushNamed(VideoPlayerPage.name, extra: {
          "mediaEntity": MediaModel.vod(widget.video),
          "isTrailer": true
        });
      }
    ),
    (
      focusNode: widget.seasonsBtnFocusNode,
      shouldRender: widget.video.episodes.isNotEmpty,
      icon: Assets.videoPlay,
      label: 'Seasons',
      onPressed: (_) {
        final VodTvDetailsCubit cubit = context.read<VodTvDetailsCubit>();

        cubit.setSeasonsSelected();
      }
    )
  ];

  @override
  Widget build(BuildContext context) {
    final VodModel video = widget.video;
    final SavedButtonModel buttonModel = SavedButtonUtil.getModel(
      context.select<VodCubit, bool>((c) {
        return c.state.savedVideos.contains(video.id);
      }),
    );

    return BlocBuilder<VodTvDetailsCubit, VodTvDetailsState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EnsureVisibleWhenFocused(
              focusNode: widget.saveBtnFocusNode,
              child: AppChip.largePrimaryRounded(
                focusNode: widget.saveBtnFocusNode,
                isOutlined: buttonModel.isOutlined,
                label: buttonModel.label,
                onPressed: () {
                  context.read<VodCubit>().saveVideo(video);
                },
                prefixIcon: (asset: buttonModel.icon, size: 25),
              ),
            ),
            Margins.vertical20,
            for (final button in _buttonList)
              if (button.shouldRender)
                EnsureVisibleWhenFocused(
                  focusNode: button.focusNode,
                  child: FocusTextButton(
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
// focusNode: FocusNode(canRequestFocus: false, skipTraversal: true)

        );
  }
}

class _SeasonsListView extends StatefulWidget {
  const _SeasonsListView({required this.seasons, required this.data});

  final Map<String, List<EpisodeModel>> seasons;
  final VodModel data;

  @override
  _SeasonsListViewState createState() => _SeasonsListViewState();
}

class _SeasonsListViewState extends State<_SeasonsListView> {
  late String _selectedSeasonKey = widget.seasons.keys.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SeasonsList(
          seasons: widget.seasons,
          selectedSeasonKey: _selectedSeasonKey,
          onSeasonSelected: (key) {
            setState(() {
              _selectedSeasonKey = key;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35),
          child: FocusWrapper(
              focusNodeCount: widget.seasons[_selectedSeasonKey]!.length,
              focusNode: FocusNode(),
              focusActionMap: {
                LogicalKeyboardKey.arrowRight: (context, focusNodes) {
                  return focusNodes.shiftFocusDown(context, focusNodes);
                },
              },
              build: (context, focusNodes) {
                return SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.seasons[_selectedSeasonKey]!.length,
                    itemBuilder: (context, index) {
                      final List<EpisodeModel> episodes =
                          widget.seasons[_selectedSeasonKey] ?? [];
                      final EpisodeModel video = episodes[index];
                      return Padding(
                        padding:
                            EdgeInsets.only(left: index == 0 ? 0 : 5, right: 5),
                        child: EnsureVisibleWhenFocused(
                          focusNode: focusNodes[index],
                          duration: Duration.zero,
                          child: AppCard.tvSeries(
                            focusNode: focusNodes[index],
                            onTap: () {
                              setState(() {
                                context.pushNamed(VideoPlayerPage.name, extra: {
                                  "isTrailer": false,
                                  "mediaEntity": MediaModel.episode(video)
                                });
                              });
                            },
                            content: Text(
                              video.title,
                              style: cardTextStyle.white,
                            ),
                            image: video.storageRecord.banner ?? '',
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class _SeasonsList extends StatelessWidget {
  final Map<String, List<EpisodeModel>> seasons;
  final String selectedSeasonKey;
  final Function(String) onSeasonSelected;

  const _SeasonsList({
    required this.seasons,
    required this.selectedSeasonKey,
    required this.onSeasonSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FocusWrapper(
      focusNode: FocusNode(),
      focusActionMap: {
        LogicalKeyboardKey.arrowRight: (context, focusNodes) =>
            focusNodes.shiftFocusDown(context, focusNodes),
      },
      focusNodeCount: seasons.length,
      build: (context, focusNodes) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (final (index, entry) in seasons.keys.indexed)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: AppChip.mediumPrimaryRounded(
                    focusNode: focusNodes[index],
                    isOutlined: selectedSeasonKey != entry,
                    label: entry,
                    onPressed: () => onSeasonSelected(entry),
                    color: context.uiColors.primary,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
