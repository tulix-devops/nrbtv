import 'package:app_logger/app_logger.dart';
import 'package:commons/commons.dart';
import 'package:nrbtv/src/core/services/device_model_service.dart';
import 'package:flutter/material.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/ui/widgets/widgets.dart';
import 'package:flutter/services.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({
    super.key,
    required this.video,
    required this.isTrailer,
  });

  final ContentModel video;
  final bool isTrailer;

  static const name = 'video-player';
  static const path = 'video-player';

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  @override
  void initState() {
    if (!context.isTv) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.video.sources.getPreferredVideoSource());
    logger.i('${widget.video.id} ${widget.video.type} ${widget.video.seasons}');
    String? seriesLink = widget.video.type == 'series'
        ? widget.video.seasons?.values.first.episodes.values.first.sources
            .getPreferredVideoSource()
        : null;
    return Scaffold(
      body: AppVideoPlayer(
        video: widget.video,
        image: widget.video.images.getThumbnail(),
        link:
            seriesLink ?? widget.video.sources.getPreferredVideoSource() ?? '',
      ),
    );
  }
}
