import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nrbtv/src/bloc/bloc.dart';
import 'package:nrbtv/src/core/core.dart';
import 'package:nrbtv/src/ui/widgets/widgets.dart';
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
  late final FocusNode focusNode = FocusNode(
    canRequestFocus: true,
    skipTraversal: true,
  )..addListener(() {
      if (mounted) {
        context.read<AppCubit>().isNavigationFocused(focusNode.hasFocus ||
            focusNode.descendants.any(
              (element) => element.hasFocus,
            ));
      }
    });

  late final FocusNode bodyFocus = FocusNode(
      canRequestFocus: false,
      onKeyEvent: (node, event) {
        if (!context.isTv) {
          return KeyEventResult.ignored;
        }
        if (event.logicalKey == LogicalKeyboardKey.goBack &&
            !context.canPop()) {
          Future.delayed(const Duration(milliseconds: 200),
              () => focusNode.requestFocus());
          return KeyEventResult.handled;
        }
        context.read<AppCubit>().isNavigationFocused(false);
        return KeyEventResult.ignored;
      });

  @override
  Widget build(BuildContext context) {
    final Widget body = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        if (widget.hasNavbar && context.isTv)
          BlocSelector<AppCubit, AppState, BottomBarTab>(
            selector: (state) {
              return state.currentTab;
            },
            builder: (context, currentTab) {
              return AppNavigationRail(
                focusNode: focusNode,
                onPressed: (s) {
                  if (context.canPop()) {
                    context.read<AppCubit>().changeTab(s, canPop: true);
                    context.pop();
                  } else {
                    context.read<AppCubit>().changeTab(s);
                  }
                },
                currentTab: currentTab,
              );
            },
          ),
        Expanded(
            child: Focus(
          onFocusChange: (value) {
            if (value) {
              context.read<AppCubit>().isNavigationFocused(false);
            }
          },
          focusNode: bodyFocus,
          child: widget.body,
        ))
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
