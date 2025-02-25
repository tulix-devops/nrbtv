import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/index.dart';
import 'package:ui_kit/ui_kit.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    super.key,
    this.color,
    this.hasNavbar = true,
    required this.body,
  });

  /// ScrollView Body
  final Widget body;

  /// Scaffold Color
  final Color? color;

  // Also changes system nav bar color
  final bool hasNavbar;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  bool hasFocus = false;
  final FocusNode _placeHolderFocus = FocusNode();

  late final FocusNode navigationFocus = FocusNode()
    ..addListener(navigationListener);

  void navigationListener() {
    if (mounted) {
      setState(() {
        hasFocus = navigationFocus.hasFocus ||
            navigationFocus.descendants.any((element) => element.hasFocus);
      });
      context.read<AppCubit>().isNavigationFocused(navigationFocus.hasFocus ||
          navigationFocus.descendants.any(
            (element) => element.hasFocus,
          ));
    }
  }

  late final FocusNode contentFocusNode = FocusNode(
      canRequestFocus: false,
      onKeyEvent: (node, event) {
        if (!context.isTv) {
          return KeyEventResult.ignored;
        }
        if (event.logicalKey == LogicalKeyboardKey.goBack) {
          Future.delayed(const Duration(milliseconds: 200), () {
            setState(() {
              hasFocus = true;
              navigationFocus.requestFocus();
            });
          });

          return KeyEventResult.handled;
        }
        context.read<AppCubit>().isNavigationFocused(false);
        return KeyEventResult.ignored;
      });

  @override
  void dispose() {
    contentFocusNode.dispose();
    _placeHolderFocus.dispose();
    navigationFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget body = Stack(
      children: <Widget>[
        Focus(
          onFocusChange: (value) {
            if (value) {
              context.read<AppCubit>().isNavigationFocused(false);
            }
          },
          focusNode: contentFocusNode,
          child: widget.body,
        ),
        if (widget.hasNavbar && context.isTv)
          Positioned(
            child: BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                return AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  child: AnimatedSwitcher(
                    switchInCurve: Curves.easeInOut,
                    switchOutCurve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      final offsetAnimation = Tween<Offset>(
                        begin: const Offset(-1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: Tween<double>(begin: 0.8, end: 1.0)
                                .animate(animation),
                            child: child,
                          ),
                        ),
                      );
                    },
                    child: _placeHolderFocus.hasFocus || hasFocus
                        ? AppNavigationRail(
                            key: const ValueKey('AppNavigationRail'),
                            focusNode: navigationFocus,
                            onPressed: (s) {
                              if (context.canPop()) {
                                context
                                    .read<AppCubit>()
                                    .changeTab(s, canPop: true);
                                context.pop();
                              } else {
                                print(s);
                                context.read<AppCubit>().changeTab(s);
                              }
                            },
                            currentTab: state.currentTab,
                          )
                        : Focus(
                            key: const ValueKey('EmptyFocusPlaceholder'),
                            onFocusChange: (value) {
                              if (value) {
                                navigationFocus.requestFocus();
                              }
                              setState(() {});
                            },
                            focusNode: _placeHolderFocus,
                            child: const SizedBox.shrink(),
                          ),
                  ),
                );
              },
            ),
          ),
      ],
    );

    return UiOverlayProvider(
      child: OverlayStack(
        child: Scaffold(
          backgroundColor: context.uiColors.surface,
          bottomNavigationBar: widget.hasNavbar && !context.isTv
              ? BlocSelector<AppCubit, AppState, BottomBarTab>(
                  selector: (state) {
                    return state.currentTab;
                  },
                  builder: (context, currentTab) {
                    return AppBottomBar(
                      onPressed: (s) {
                        context.read<AppCubit>().changeTab(s);
                      },
                      currentTab: currentTab,
                    );
                  },
                )
              : null,
          extendBody: true,
          body: context.isTv
              ? SafeArea(
                  minimum: const EdgeInsets.all(10),
                  child: body,
                )
              : body,
        ),
      ),
    );
  }
}
