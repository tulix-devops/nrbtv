import 'dart:async';
import 'package:commons/shared/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/content_cubit/content_cubit.dart';

import 'package:nrbtv/src/index.dart';
import 'package:nrbtv/src/ui/pages/vod/phone_widgets/widgets.dart';
import 'package:ui_kit/ui_kit.dart';

part 'filter_page.dart';

/// [VodPage] is the search page on mobile
/// [VodPage] is a regular page on TV
class VodPage extends StatefulWidget {
  const VodPage({super.key, required this.contentTypeIndex});
  final int contentTypeIndex;

  @override
  State<VodPage> createState() => _VodPageState();
}

class _VodPageState extends State<VodPage> {
  @override
  void initState() {
    context.read<ContentCubit>().reset();
    // context
    //     .read<ContentCubit>()
    //     .getPaginatedListById(id: widget.contentTypeIndex, limit: 6);
    // Future.microtask(
    //   () => _initializeSelectedCategory(),
    // );
    super.initState();
  }

  // void _initializeSelectedCategory() {
  //   final VodFilterBloc vodFilterBloc = context.read<VodFilterBloc>();

  //   final int? selectedCategoryId =
  //       context.read<VodCubit>().state.selectedCategoryId;

  //   if (selectedCategoryId == null) {
  //     vodFilterBloc.add(const VodFilterEvent.initialize());
  //     return;
  //   }

  //   context.read<VodCubit>().resetSelectedCategoryId();

  //   vodFilterBloc.add(
  //     VodFilterEvent.initializeWithFilter(selectedCategoryId),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return DeviceWrapper(
      tvWidget: ContentTvView(contentType: widget.contentTypeIndex),
      widget: const VodMobileView(),
    );
  }
}
