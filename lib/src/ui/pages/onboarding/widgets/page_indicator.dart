import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/bloc.dart';
import 'package:nrbtv/src/data/data.dart';
import 'package:ui_kit/theme/app_colors.dart';

class PageIndicator extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  PageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OnboardingCubit, OnboardingState,
        (List<OnboardingModel>, int)>(
      selector: (state) => (state.onboardingTabList, state.pageIndex),
      builder: (context, state) {
        final OnboardingState state = context.read<OnboardingCubit>().state;
        final int listLength = state.onboardingTabList.length;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<_PageIndicatorDot>.generate(
            listLength,
            (index) => _PageIndicatorDot(
              index: index,
              isActive: index == state.pageIndex,
              onPressed: () =>
                  context.read<OnboardingCubit>().onIndicatorPressed(index),
            ),
          ),
        );
      },
    );
  }
}

class _PageIndicatorDot extends StatelessWidget {
  const _PageIndicatorDot({
    required this.isActive,
    required this.index,
    required this.onPressed,
  });

  final bool isActive;
  final int index;
  final void Function() onPressed;

  double get size => isActive ? 10 : 8;
  LinearGradient? get gradient => isActive ? AppColors.pinkGradient : null;
  Color? get color => !isActive ? AppColors.greyscale[300] : null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        autofocus: false,
        focusNode: FocusNode(canRequestFocus: false, skipTraversal: true),
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Container(
          decoration: _buildDecoration(),
          child: Ink(
            padding: EdgeInsets.all(size / 1.8),
            decoration: _buildDecoration(),
            child: AnimatedContainer(
              duration: Durations.long2,
              curve: Curves.easeIn,
              width: isActive ? 30 : size,
              height: isActive ? 8 : 8,
              child: const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: color,
      gradient: gradient,
      borderRadius: BorderRadius.circular(50),
    );
  }
}
