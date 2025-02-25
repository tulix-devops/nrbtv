import 'dart:ui';

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
    (label: 'Live', icon: Assets.liveIcon, value: BottomBarTab.live),
    (label: 'Archive', icon: Assets.homeIcon, value: BottomBarTab.archive),
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
          list[index - 1].requestFocus();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          if (index == length - 1) {
            return KeyEventResult.skipRemainingHandlers;
          }
          list[index + 1].requestFocus();
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
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          color: const Color.fromRGBO(24, 26, 32, 0.85),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                Assets.nrbLogo,
                height: 50,
              ),
              Focus(
                focusNode: widget.focusNode,
                onFocusChange: (value) {
                  print('123');
                  if (value) {
                    print(widget.currentTab);
                    list[widget.currentTab.index].requestFocus();
                    setState(() {});
                  }
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final (index, button) in _buttons.indexed) ...[
                        if (index == _buttons.length - 1)
                          const SizedBox(
                            height: 50,
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              focusNode: list[index],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(45)),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: SizedBox(
                                  width: 200,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: 70,
                                        child: AppIcon(
                                          button.icon,
                                          height: 15,
                                          width: 15,
                                          color: AppColors.greyscale[500],
                                          gradient: _getSelectedColor(
                                              button.value, widget.currentTab),
                                        ),
                                      ),
                                      AppText(
                                        style: TextStyles.bodySmallBold,
                                        text: button.label,
                                        gradient: _getSelectedColor(
                                            button.value, widget.currentTab),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ]
                    ]),
              ),
            ],
          ),
        ));
  }

  LinearGradient? _getSelectedColor(
      BottomBarTab value, BottomBarTab currentTab) {
    return value == widget.currentTab ? context.uiColors.primaryGradient : null;
  }
}
