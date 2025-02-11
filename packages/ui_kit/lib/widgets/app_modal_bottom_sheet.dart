import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AppBottomSheetModal extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final String? label;
  final Color? titleColor;

  const AppBottomSheetModal(
      {super.key,
      required this.children,
      this.label,
      required this.title,
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
        color:
            context.isDarkMode ? AppColors.dark2 : context.uiColors.onPrimary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
              style: TextStyles.h4.copyWith(
                color: titleColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: AppDivider(),
            ),
            if (label != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(label!, style: TextStyles.h4.surface(context)),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[...children],
            )
          ],
        ),
      ),
    );
  }
}
