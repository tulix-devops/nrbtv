// Custom InheritedWidget to provide UiColors based on platform brightness
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class UiColorProvider extends InheritedWidget {
  final UiColors uiColors;

  const UiColorProvider({
    super.key,
    required this.uiColors,
    required Widget child,
  }) : super(child: child);

  static UiColorProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UiColorProvider>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

// Widget that listens to platform brightness and provides appropriate colors
class ThemeColorListener extends StatefulWidget {
  final Widget child;

  const ThemeColorListener({
    super.key,
    required this.child,
  });

  @override
  State<ThemeColorListener> createState() => _ThemeColorListenerState();
}

class _ThemeColorListenerState extends State<ThemeColorListener> {
  late DarkUiColors _darkUiColors;
  late LightUiColors _lightUiColors;
  @override
  void initState() {
    _darkUiColors = const DarkUiColors(AppThemeColor.blue);
    _lightUiColors = const LightUiColors(AppThemeColor.blue);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UiColorProvider(
      uiColors: _darkUiColors,
      child: widget.child,
    );
  }
}

extension UiColorProviderExtension on BuildContext {
  UiColors get uiColors {
    final UiColorProvider? provider = UiColorProvider.of(this);

    assert(provider != null, 'No UiColorProvider found in context');

    return provider!.uiColors;
  }
}
