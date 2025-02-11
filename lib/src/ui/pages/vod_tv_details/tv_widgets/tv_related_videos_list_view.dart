import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/content_cubit/content_cubit.dart';
import 'package:nrbtv/src/ui/widgets/widgets.dart';

class TvRelatedVideosListView extends StatefulWidget {
  const TvRelatedVideosListView({
    super.key,
    required this.primaryFocusNode,
  });

  final FocusNode primaryFocusNode;

  @override
  State<TvRelatedVideosListView> createState() =>
      _TvRelatedVideosListViewState();
}

class _TvRelatedVideosListViewState extends State<TvRelatedVideosListView> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
    // return BlocBuilder<ContentCubit, ContentState>(
    //   builder: (context, state) {
    //     if (!state.status.isSuccess) {
    //       return const SliverToBoxAdapter(
    //         child: SizedBox.shrink(),
    //       );
    //     }

    //     return SliverToBoxAdapter(
    //       child: Padding(
    //         padding: const EdgeInsets.only(left: 35),
    //         child: TvPageView(
    //           videos: state.content,
    //           focusNode: widget.primaryFocusNode,
    //           onPressed: (_, __) {},
    //           headerTitle: 'More Like This',
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  // void _onEnterPressed(BuildContext context, VodModel vod) {
  //   context.pushNamed(
  //     VodTvDetailsPage.name,
  //     extra: (vodCubit: context.read<VodCubit>(), vodEntity: vod),
  //   );
  // }
}
