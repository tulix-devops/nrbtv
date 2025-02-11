import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class OnboardingTab extends StatelessWidget {
  final String title;
  final String subTitle;

  const OnboardingTab({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 70,
          child: Image.asset(
            Assets.pockoLogo,
            fit: BoxFit.cover,
            height: MediaQuery.sizeOf(context).height * 0.3,
          ),
        ),
        Positioned(
          bottom: 130,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Margins.vertical16,
                Text(
                  title,
                  style: TextStyles.bodyXLargeMedium.white,
                  textAlign: TextAlign.center,
                ),
                Margins.vertical16,
                Text(
                  subTitle,
                  style: TextStyles.bodyXLargeMedium.white,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
