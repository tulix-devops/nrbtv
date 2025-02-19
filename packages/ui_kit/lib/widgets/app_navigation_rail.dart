import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_kit/ui_kit.dart';

class AppNavigationRail extends StatefulWidget {
  const AppNavigationRail(
      {super.key,
      required this.onPressed,
      required this.currentTab,
      required this.focusNode});
  final ValueChanged onPressed;
  final BottomBarTab currentTab;
  final FocusNode focusNode;

  @override
  State<AppNavigationRail> createState() => _AppNavigationRailState();
}

class _AppNavigationRailState extends State<AppNavigationRail> {
  late final List<({String label, String icon, BottomBarTab value})> _buttons =
      [
    (
      label: 'Search',
      icon: Assets.searchNavigationIcon,
      value: BottomBarTab.archive
    ),
    (label: 'Home', icon: Assets.homeIcon, value: BottomBarTab.archive),
    (label: 'Live', icon: Assets.liveIcon, value: BottomBarTab.live),
    // (label: 'VOD', icon: Assets.videoIcon, value: BottomBarTab.vod),
    // (label: 'Series', icon: Assets.tvShowIcon, value: BottomBarTab.series),
    (label: 'Account', icon: Assets.accountIcon, value: BottomBarTab.account),
  ];
  FocusNode _getFocus(int index, int length) {
    return FocusNode(
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent) {
          return KeyEventResult.ignored;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          if (index == 0) {
            return KeyEventResult.skipRemainingHandlers;
          }
          FocusScope.of(context).focusInDirection(TraversalDirection.up);
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          if (index == length - 1) {
            return KeyEventResult.skipRemainingHandlers;
          }
          FocusScope.of(context).focusInDirection(TraversalDirection.down);
          return KeyEventResult.handled;
        }

        return KeyEventResult.ignored;
      },
    );
  }

  late final List<FocusNode> list = List.generate(_buttons.length, (value) {
    return _getFocus(value, _buttons.length);
  });
  @override
  void dispose() {
    for (var element in list) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(Assets.nrbLogo, height: 45),
          Column(children: [
            for (final (index, button) in _buttons.indexed)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Focus(
                  focusNode: widget.focusNode,
                  onFocusChange: (value) {
                    if (value) {
                      if (widget.currentTab.index >= 0 &&
                          widget.currentTab.index < list.length) {
                        list[widget.currentTab.index].requestFocus();
                      }
                      setState(() {});
                    }
                  },
                  child: InkWell(
                    focusNode: list[index],
                    borderRadius: const BorderRadius.all(Radius.circular(45)),
                    onTap: () {
                      if (button.value == widget.currentTab &&
                          Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }

                      if (button.value != widget.currentTab) {
                        widget.onPressed(button.value);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 80,
                            child: AppIcon(
                              button.icon,
                              height: 25,
                              width: 25,
                              color: AppColors.greyscale[500],
                              gradient: _getSelectedColor(
                                  button.value, widget.currentTab),
                            ),
                          ),
                          Text(
                            button.label,
                            style: TextStyles.bodyMedium.copyWith(
                                color: _getSelectedTextColor(
                                    button.value, widget.currentTab)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
          ]),
        ],
      ),
    );
  }

  Color _getSelectedTextColor(BottomBarTab value, BottomBarTab currentTab) {
    return value == widget.currentTab
        ? context.uiColors.primary
        : AppColors.greyscale[500]!;
  }

  LinearGradient? _getSelectedColor(
      BottomBarTab value, BottomBarTab currentTab) {
    return value == widget.currentTab ? context.uiColors.primaryGradient : null;
  }
}
