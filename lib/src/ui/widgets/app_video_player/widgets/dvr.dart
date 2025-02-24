import 'package:commons/shared/extensions.dart';
import 'package:flutter/services.dart';
import 'package:nrbtv/src/bloc/epg_cubit/epg_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/data/models/content/tv_schedule_model.dart';
import 'package:nrbtv/src/ui/pages/pages.dart';
import 'package:ui_kit/ui_kit.dart';

class Dvr extends StatefulWidget {
  const Dvr({
    super.key,
    required this.callback,
  });

  final void Function() callback;

  @override
  State<Dvr> createState() => _DvrState();
}

class _DvrState extends State<Dvr> {
  int _currentPage = 0;
  late String _selectedDay;

  final FocusNode dvrFocus = FocusNode();
  final FocusNode cardContainerFocus = FocusNode();

  late final Map<String, List<TvScheduleModel>>? seriesData;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    seriesData = context.read<EpgCubit>().state.epgContent;
    _selectedDay = seriesData!.keys.first;
    dvrFocus.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (seriesData == null || seriesData!.isEmpty) {
      return const SizedBox.shrink();
    }
    return Focus(
      focusNode: dvrFocus,
      onFocusChange: (value) => setState(() {}),
      onKeyEvent: (node, event) => _handleKeyEvent(event),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 200,
            height: MediaQuery.sizeOf(context).height - 40,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: seriesData!.keys.length,
              itemBuilder: (context, index) {
                final key = seriesData?.keys.elementAt(index);
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: (index == _currentPage) && dvrFocus.hasFocus
                          ? context.uiColors.onSurface
                          : Colors.transparent,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      '$key ${index == 0 ? 'Today' : ''}',
                      style: TextStyles.bodyMediumBold,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  final offsetAnimation = Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                child: _DvrCards(
                  cardContainerFocus: cardContainerFocus,
                  key: ValueKey<String>(_selectedDay),
                  selectedDay: _selectedDay,
                  seriesData: seriesData!,
                )),
          ),
        ],
      ),
    );
  }

  void updateScrollPosition(int index) {
    if (_scrollController.hasClients) {
      final double offset = index * 50.0;
      _scrollController.animateTo(
        offset.clamp(0.0, _scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  KeyEventResult _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        setState(() {
          _currentPage = (_currentPage + 1) % seriesData!.keys.length;
          updateScrollPosition(_currentPage);
        });
        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        dvrFocus.unfocus();
        cardContainerFocus.requestFocus();
        setState(() {});

        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        setState(() {
          _currentPage = (_currentPage - 1 + seriesData!.keys.length) %
              seriesData!.keys.length;
          updateScrollPosition(_currentPage);
        });
        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.enter ||
          event.logicalKey == LogicalKeyboardKey.select) {
        setState(() {
          _selectedDay = seriesData!.keys.elementAt(_currentPage);
        });
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }
}

class _DvrCards extends StatefulWidget {
  const _DvrCards({
    super.key,
    required this.seriesData,
    required this.selectedDay,
    required this.cardContainerFocus,
  });

  final Map<String, List<TvScheduleModel>> seriesData;
  final String selectedDay;
  final FocusNode cardContainerFocus;

  @override
  State<_DvrCards> createState() => __DvrCardsState();
}

class __DvrCardsState extends State<_DvrCards> {
  int _currentCardIndex = 0;
  final ScrollController _scrollController = ScrollController();
  void updateScrollPosition(int index) {
    if (_scrollController.hasClients) {
      final double offset = index * 200.0;
      _scrollController.animateTo(
        offset.clamp(0.0, _scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.cardContainerFocus.hasFocus);
    return Focus(
      focusNode: widget.cardContainerFocus,
      onFocusChange: (value) {
        setState(() {});
      },
      onKeyEvent: (node, event) => _handleKeyEvent(event),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height - 40,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.seriesData[widget.selectedDay]!.length,
          itemBuilder: (context, index) {
            final TvScheduleModel item =
                widget.seriesData[widget.selectedDay]![index];
            return Container(
              padding: const EdgeInsets.all(1),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: (index == _currentCardIndex) &&
                          widget.cardContainerFocus.hasFocus
                      ? context.uiColors.onSurface
                      : Colors.transparent,
                ),
              ),
              height: 200,
              child: Row(
                children: [
                  SizedBox(
                    child: Image.network(
                      item.thumbnail,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(Assets.nrbLogo, fit: BoxFit.cover);
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: context.uiColors.primary,
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.name,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text('${item.start}-${item.end}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  KeyEventResult _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        setState(() {
          _currentCardIndex = (_currentCardIndex + 1) %
              widget.seriesData[widget.selectedDay]!.length;
        });
        updateScrollPosition(_currentCardIndex);
        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        setState(() {
          _currentCardIndex = (_currentCardIndex -
                  1 +
                  widget.seriesData[widget.selectedDay]!.length) %
              widget.seriesData[widget.selectedDay]!.length;
          updateScrollPosition(_currentCardIndex);
        });
        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.enter ||
          event.logicalKey == LogicalKeyboardKey.select) {
        context.pushNamed(VideoPlayerPage.path, extra: {
          'tvScheduleModel':
              widget.seriesData[widget.selectedDay]![_currentCardIndex],
          'epgCubit': context.read<EpgCubit>(),
          'isTrailer': false
        });

        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }
}
