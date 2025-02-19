import 'package:nrbtv/src/bloc/epg_cubit/epg_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/data/models/content/tv_schedule_model.dart';
import 'package:nrbtv/src/index.dart';
import 'package:nrbtv/src/ui/widgets/app_video_player/mobile_player_container.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:ui_kit/widgets/app_loading_indicator.dart';

class MobileContentPage extends StatefulWidget {
  const MobileContentPage({super.key});

  @override
  State<MobileContentPage> createState() => _MobileContentPageState();
}

class _MobileContentPageState extends State<MobileContentPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    // await context.read<EpgCubit>().getLive();

    // final ContentCubit cubit = context.read<ContentCubit>();
    // cubit.getContentList(ContentType.movie.value);
    // _scrollController.addListener(() {
    //   if (_scrollController.position.atEdge) {
    //     bool isBottom = _scrollController.position.pixels ==
    //         _scrollController.position.maxScrollExtent;

    //     if (isBottom) {
    //       cubit.nextPage();
    //       cubit.getContentList(cubit.state.selectedContent.value);
    //     }
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpgCubit, EpgState>(
      builder: (context, state) {
        final bool isLoading =
            state.live == null || state.live!.sources == null;

        return AppStatusWidget(
          status: state.status,
          errorWidget: const Center(child: Text('error')),
          loaderWidget: const Center(
            child: AppLoadingIndicator(size: 70),
          ),
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isLoading) ...[
                MobilePlayerContainer(
                  isLive: true,
                  video: TvScheduleModel(
                      id: state.live!.id,
                      start: '',
                      end: '',
                      name: state.live!.title,
                      link: state.live!.sources.getPreferredVideoSource()!,
                      thumbnail: state.live!.images.getBanner(),
                      isFuture: false),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Margins.vertical10,
                      Text(
                        state.live!.title,
                        style: TextStyles.h3,
                      ),
                      Margins.vertical36,
                      Text(
                        state.live!.description,
                        style: TextStyles.bodyLargeMedium,
                      )
                    ],
                  ),
                )
              ]
            ],
          ),
        );
      },
    );
  }
}
