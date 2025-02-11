import 'package:nrbtv/src/data/models/content/seasons_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:river_player/river_player.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:nrbtv/src/bloc/bloc.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:shimmer/shimmer.dart' as DefaultShimmer;

class Dvr extends StatefulWidget {
  const Dvr({
    super.key,
    required this.controller,
    required this.callback,
  });

  final BetterPlayerController controller;
  final void Function() callback;

  @override
  State<Dvr> createState() => _DvrState();
}

class _DvrState extends State<Dvr> {
  int _currentPage = 0;
  int _selectedIndex = 0;

  final FocusNode dvrFocus = FocusNode();

  late final Map<int, SeasonModel> seriesData;

  ({int selectedPage, int selectedItemIndex})? selectedLinkIndexes;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    seriesData = context.read<VideoPlayerCubit>().state.video!.seasons!;
    dvrFocus.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 100),
      child: Focus(
        focusNode: dvrFocus,
        onKeyEvent: (node, event) => _handleKeyEvent(node, event, seriesData),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: List.generate(
                seriesData.values.length,
                (index) {
                  final key = seriesData.keys.elementAt(index);
                  final value = seriesData.values.elementAt(index);
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: index == _currentPage
                            ? context.uiColors.onSurface
                            : Colors.transparent,
                      ),
                    ),
                    child: SizedBox(
                      height: 50,
                      width: 250,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Season ${key.toString()}',
                              style: TextStyles.bodyMediumBold,
                            ),
                            const Spacer(),
                            Text(
                              '${value.episodes.values.length} ${value.episodes.values.length == 1 ? 'episode' : 'epsiodes'}',
                              style: TextStyles.bodyMedium.copyWith(
                                color:
                                    context.uiColors.onSurface.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Margins.horizontal20,
            Flexible(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 1),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  );
                },
                child: ListView.builder(
                  key: ValueKey<int>(_currentPage),
                  controller: _scrollController,
                  itemCount: seriesData.values
                      .elementAt(_currentPage)
                      .episodes
                      .values
                      .length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, valueIndex) {
                    final ContentModel episodeItem = seriesData.values
                        .elementAt(_currentPage)
                        .episodes
                        .values
                        .elementAt(valueIndex);
                    final bool isHovered = _selectedIndex == valueIndex;
                    final bool isSelected =
                        _isSelectedIndex(valueIndex, 1, selectedLinkIndexes);
                    final ({Color backgroundColor, Color textColor}) color =
                        _getColor(isSelected, isHovered, context);

                    return SizedBox(
                      height: 200,
                      child: ColoredBox(
                        color: color.backgroundColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 22),
                          child: Row(children: [
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    style: BorderStyle.solid,
                                    width: 2,
                                    color: _selectedIndex == valueIndex
                                        ? context.uiColors.onSurface
                                        : Colors.transparent,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      episodeItem.images.getBanner(),
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return DefaultShimmer.Shimmer
                                            .fromColors(
                                          baseColor: context.uiColors.tvSurface
                                              .withOpacity(0.7),
                                          highlightColor:
                                              context.uiColors.secondary,
                                          child: Container(
                                            width: 150,
                                            height: 200,
                                            color: Colors.white,
                                          ),
                                        );
                                      },
                                    ),
                                    Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.black.withOpacity(0.7),
                                            Colors.transparent,
                                            Colors.black.withOpacity(0.7),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          stops: const [0.2, 0.5, 0.8],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      left: 5,
                                      child: Text(
                                        'S${seriesData.keys.elementAt(_currentPage)}:E${valueIndex + 1}',
                                        style: TextStyles.bodyLargeBold,
                                      ),
                                    ),
                                  ],
                                )),
                            Margins.horizontal20,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  episodeItem.title,
                                  maxLines: 1,
                                  style: TextStyles.bodyLargeBold
                                      .copyWith(color: color.textColor),
                                ),
                                Margins.vertical16,
                                SizedBox(
                                  width: 160,
                                  child: Text(
                                    episodeItem.description ?? 'No Description',
                                    maxLines: 4,
                                    style: TextStyles.bodyMedium.copyWith(
                                      color: color.textColor,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  KeyEventResult _handleKeyEvent(
      FocusNode node, KeyEvent event, Map<int, SeasonModel> seasonData) {
    final currentSeason = seasonData[seasonData.keys.elementAt(_currentPage)];
    if (currentSeason == null) return KeyEventResult.ignored;

    final selectedEpisodeKey =
        currentSeason.episodes.keys.elementAt(_selectedIndex);
    final selectedEpisode = currentSeason.episodes[selectedEpisodeKey];

    void navigateToNextSeason() {
      if (_currentPage < seasonData.keys.length - 1) {
        setState(() {
          _currentPage++;
          _selectedIndex = 0;
        });
        dvrFocus.requestFocus();
      }
    }

    void navigateToPreviousSeason() {
      if (_currentPage > 0) {
        setState(() {
          _currentPage--;
          _selectedIndex = 0;
        });
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        dvrFocus.requestFocus();
      }
    }

    void updateScrollPosition() {
      final double offset = _selectedIndex * 200;
      _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    KeyEventResult playSelectedEpisode() {
      if (selectedEpisode?.sources.getPreferredVideoSource() != null) {
        widget.controller.setupDataSource(
          BetterPlayerDataSource(
            BetterPlayerDataSourceType.network,
            selectedEpisode!.sources.getPreferredVideoSource()!,
          ),
        );
        setState(() {
          selectedLinkIndexes = (
            selectedPage: _currentPage,
            selectedItemIndex: _selectedIndex,
          );
        });
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    }

    if (event.logicalKey == LogicalKeyboardKey.goBack) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!mounted) return;
        setState(widget.callback);
        context.read<VideoPlayerCubit>().changeVisibility(false);
      });
      return KeyEventResult.handled;
    }

    if (event is! KeyDownEvent) return KeyEventResult.ignored;

    switch (event.logicalKey) {
      case LogicalKeyboardKey.select || LogicalKeyboardKey.enter:
        return playSelectedEpisode();
      case LogicalKeyboardKey.arrowDown:
        if (_selectedIndex < currentSeason.episodes.length - 1) {
          setState(() => _selectedIndex++);
          updateScrollPosition();
        } else if (_currentPage < seasonData.keys.length - 1) {
          navigateToNextSeason();
        }
        return KeyEventResult.handled;

      case LogicalKeyboardKey.arrowUp:
        if (_selectedIndex > 0) {
          setState(() => _selectedIndex--);
          updateScrollPosition();
        } else {
          navigateToPreviousSeason();
        }
        return KeyEventResult.handled;

      case LogicalKeyboardKey.arrowRight:
        navigateToNextSeason();
        return KeyEventResult.handled;

      case LogicalKeyboardKey.arrowLeft:
        navigateToPreviousSeason();
        return KeyEventResult.handled;

      default:
        return KeyEventResult.ignored;
    }
  }

  bool _isSelectedIndex(int valueIndex, int pageIndex,
      ({int selectedPage, int selectedItemIndex})? selectedLinkIndexes) {
    return selectedLinkIndexes?.selectedItemIndex == valueIndex &&
        selectedLinkIndexes?.selectedPage == pageIndex;
  }

  ({Color backgroundColor, Color textColor}) _getColor(
      bool isSelected, bool isHovered, BuildContext context) {
    if (isSelected) {
      return (
        backgroundColor: context.uiColors.primary,
        textColor: context.uiColors.onSurface
      );
    }
    if (isHovered) {
      return (
        backgroundColor: context.uiColors.secondary,
        textColor: context.uiColors.onSurface
      );
    }

    return (
      backgroundColor: Colors.transparent,
      textColor: context.uiColors.onSurface
    );
  }
}
