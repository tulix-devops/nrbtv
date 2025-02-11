import 'package:commons/shared/enums.dart';
import 'package:commons/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nrbtv/src/bloc/bloc.dart';
import 'package:nrbtv/src/ui/pages/pages.dart';
import 'package:ui_kit/ui_kit.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OnboardingCubit, OnboardingState, OnboardingState>(
      selector: (state) => state,
      builder: (context, state) {
        final bool isLastPage =
            context.read<OnboardingCubit>().isLastPage(state.pageIndex);
        final String label = isLastPage ? 'Complete' : 'Next';
        final VoidCallback? onPressedAction =
            state.status != Status.loading ? onPressed : null;

        return AppButton.primaryRounded(
          key: ValueKey(isLastPage),
          onPressed: isLastPage
              ? () async {
                  // ignore: use_build_context_synchronously
                  await context.read<OnboardingCubit>().complete();

                  if (!context.mounted) return;

                  await context.read<AppCubit>().getIsOnboardingComplete();

                  if (!context.mounted) return;

                  context.goNamed(LoginPage.name);
                }
              : onPressedAction ?? () {},
          label: label,
        );
      },
    );
  }
}
