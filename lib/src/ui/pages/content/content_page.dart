import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/epg_cubit/epg_cubit.dart';
import 'package:nrbtv/src/data/models/content/tv_schedule_model.dart';
import 'package:nrbtv/src/ui/pages/content/mobile_content/mobile_content_page.dart';
import 'package:flutter/material.dart';

import 'package:nrbtv/src/index.dart';
import 'package:nrbtv/src/ui/pages/vod/phone_widgets/widgets.dart';
import 'package:nrbtv/src/ui/widgets/app_video_player/mobile_player_container.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key, required this.contentTypeIndex});
  final int contentTypeIndex;

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return DeviceWrapper(
      tvWidget: ContentTvView(contentType: widget.contentTypeIndex),
      widget: BlocBuilder<EpgCubit, EpgState>(
        builder: (context, state) {
          return orientation == Orientation.portrait
              ? const MobileContentPage()
              : MobilePlayerContainer(
                  isLive: true,
                  video: TvScheduleModel(
                      id: state.live!.id,
                      start: '',
                      end: '',
                      name: state.live!.title,
                      link: state.live!.sources.getPreferredVideoSource()!,
                      thumbnail: state.live!.images.getBanner(),
                      isFuture: false),
                );
        },
      ),
    );
  }
}
