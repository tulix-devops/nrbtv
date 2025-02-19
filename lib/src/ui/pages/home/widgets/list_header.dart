import 'package:commons/commons.dart';
import 'package:commons/shared/enums.dart';
import 'package:nrbtv/src/bloc/content_cubit/content_cubit.dart';
import 'package:nrbtv/src/ui/pages/see_all/see_all_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nrbtv/src/bloc/bloc.dart';
import 'package:ui_kit/ui_kit.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({
    super.key,
    required this.headerTitle,
  });

  final String headerTitle;
  @override
  Widget build(BuildContext context) {
    const EdgeInsets headerPadding = EdgeInsets.fromLTRB(15, 5, 15, 5);

    return Padding(
      padding: headerPadding,
      child: Row(
        children: [
          Text(headerTitle, style: TextStyles.h5.surface(context)),
          const Spacer(),
        ],
      ),
    );
  }
}

void _onPressed(BuildContext context, String headerTitle) {
  context.pushNamed(
    SeeAllPage.name,
    extra: {
      'contentCubit': context.read<ContentCubit>(),
      'typeId': ContentType.channel.value,
    },
  );

  context.read<AppCubit>().changeTab(BottomBarTab.live);
}
