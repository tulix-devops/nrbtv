import 'package:commons/shared/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/epg_cubit/epg_cubit.dart';
import 'package:nrbtv/src/data/models/content/tv_schedule_model.dart';
import 'package:nrbtv/src/ui/pages/content/mobile_content/mobile_content_page.dart';
import 'package:flutter/material.dart';

import 'package:nrbtv/src/index.dart';
import 'package:nrbtv/src/ui/widgets/app_video_player/mobile_player_container.dart';
import 'package:ui_kit/widgets/app_loading_indicator.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key, required this.contentTypeIndex});
  final int contentTypeIndex;

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return const DeviceWrapper(
      tvWidget: LivePage(),
      widget: MobileContentPage(),
    );
  }
}

class LivePage extends StatefulWidget {
  const LivePage({super.key});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    _focusNode.requestFocus();
    super.initState();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isLoading) ...[
                InkWell(
                  focusNode: _focusNode,
                  onTap: () {
                    context.pushNamed(VideoPlayerPage.path, extra: {
                      'tvScheduleModel': TvScheduleModel(
                        id: state.live!.id,
                        start: '',
                        end: '',
                        name: state.live!.title,
                        link: state.live!.sources.getPreferredVideoSource()!,
                        thumbnail: state.live!.images.getBanner(),
                        isFuture: false,
                      ),
                      'epgCubit': context.read<EpgCubit>(),
                      'isTrailer': false
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: MobilePlayerContainer(
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
                  ),
                ),
              ]
            ],
          ),
        );
      },
    );
  }
}
