import 'package:commons/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/bloc.dart';
import 'package:nrbtv/src/ui/pages/pages.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:ui_kit/widgets/app_modal.dart';

class AppAuthDialogListener extends StatefulWidget {
  const AppAuthDialogListener({super.key, required this.child});

  final Widget child;
  @override
  State<AppAuthDialogListener> createState() => _AppAuthDialogListenerState();
}

class _AppAuthDialogListenerState extends State<AppAuthDialogListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      listenWhen: (previous, current) =>
          previous.appDialogType != current.appDialogType,
      listener: (context, state) {
        if (state.appDialogType == AppDialogType.auth) {
          showDialog(
            context: context,
            builder: (context) {
              return AppModal(
                title: 'Authentication and subscription Required',
                label: 'Please login to access this feature',
                icon: Assets.infoSquare,
                imageColor: context.uiColors.primary,
                children: [
                  AppButton.secondary(
                    label: 'Cancel',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  AppButton.primary(
                    label: 'Login',
                    onPressed: () {
                      Navigator.pop(context);
                      context.pushNamed(LoginPage.path);
                    },
                  )
                ],
              );
            },
          );
        }
      },
      child: widget.child,
    );
  }
}
