import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nrbtv/src/bloc/bloc.dart';

class DeviceWrapper extends StatelessWidget {
  final Widget? tvWidget;
  final Widget widget;

  const DeviceWrapper({
    super.key,
    this.tvWidget,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppCubit, AppState, bool>(selector: (state) {
      return state.isDeviceTv;
    }, builder: (context, state) {
      return state && tvWidget != null ? tvWidget! : widget;
    });
  }
}
