import 'package:commons/shared/extensions.dart';
import 'package:nrbtv/src/ui/pages/vod/vod_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/bloc.dart';
import 'package:ui_kit/ui_kit.dart';

class VodMobileSearchSection extends StatelessWidget {
  const VodMobileSearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: AppInput.text(
            isDeviceTv: false,
            prefixIcon: Assets.searchIcon,
            hintText: 'Search',
            onChanged: (value) {
              context.read<VodFilterBloc>().add(
                    VodFilterEvent.searchFilterChanged(value),
                  );
            },
          ),
        ),
        Margins.horizontal12,
        TextButton(
          onPressed: () {
            context.pushNamed(
              FilterPage.name,
              extra: {
                'vodFilterBloc': context.read<VodFilterBloc>(),
                'vodCubit': context.read<VodCubit>(),
              },
            );
          },
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            padding: const EdgeInsets.all(16),
            backgroundColor:
                Color.alphaBlend(Colors.red.withOpacity(0.08), AppColors.dark1),
            surfaceTintColor: Colors.transparent,
          ),
          child: AppIcon(
            Assets.filter,
            color: context.uiColors.primary,
          ),
        )
      ],
    );
  }
}
