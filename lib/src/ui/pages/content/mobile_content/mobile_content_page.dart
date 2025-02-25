import 'package:nrbtv/src/bloc/epg_cubit/epg_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/data/models/content/tv_schedule_model.dart';
import 'package:nrbtv/src/index.dart';
import 'package:nrbtv/src/ui/widgets/app_video_player/mobile_player_container.dart';
import 'package:ui_kit/ui_kit.dart';

class MobileContentPage extends StatefulWidget {
  const MobileContentPage({super.key});

  @override
  State<MobileContentPage> createState() => _MobileContentPageState();
}

class _MobileContentPageState extends State<MobileContentPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpgCubit, EpgState>(
      builder: (context, state) {
        final bool isLoading = state.live == null;

        return AppStatusWidget(
          status: state.status,
          errorWidget: const Center(child: Text('error')),
          loaderWidget: const Center(
            child: AppLoadingIndicator(size: 70),
          ),
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                Margins.vertical10,
                Text(
                  state.live!.title,
                  textAlign: TextAlign.center,
                  style:
                      TextStyles.h3.copyWith(color: context.uiColors.primary),
                ),
                const Text(
                  'Current Program',
                  style: TextStyles.bodyLarge,
                ),
                Margins.vertical36,
                const Text(
                  'Introducing NRBTV',
                  style: TextStyles.h3,
                ),
                Margins.vertical36,
                Text(
                  state.live!.description,
                  style: TextStyles.bodyLargeBold,
                ),
              ]
            ],
          ),
        );
      },
    );
  }
}
