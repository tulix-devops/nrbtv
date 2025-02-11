import 'package:app_focus/app_focus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListViewFocus extends StatefulWidget {
  ListViewFocus({
    super.key,
    required this.builder,
    this.itemCount,
    this.controller,
    required this.onFocusChange,
  }) {
    assert(itemCount != null || controller != null);
  }

  final int? itemCount;
  final ListViewController? controller;
  final Widget Function(BuildContext context, ListViewController controller)
      builder;
  final void Function(bool value, ListViewController controller) onFocusChange;

  @override
  State<ListViewFocus> createState() => _ListViewFocusState();
}

class _ListViewFocusState extends State<ListViewFocus> {
  late final ListViewController _controller = widget.controller ??
      ListViewController(
        itemCount: widget.itemCount!,
      );

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _controller.primaryFocusNode,
      onFocusChange: (value) {
        widget.onFocusChange(value, _controller);
      },
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent) {
          return KeyEventResult.ignored;
        }

        if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          _controller.previous(context);
          return KeyEventResult.handled;
        } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          _controller.next(context);
          return KeyEventResult.handled;
        } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          _controller.focusUp(context);
          return KeyEventResult.handled;
        } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          _controller.focusDown(context);
          return KeyEventResult.handled;
        }

        return KeyEventResult.ignored;
      },
      child: widget.builder(context, _controller),
    );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }

    super.dispose();
  }
}
