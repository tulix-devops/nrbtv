import 'package:nrbtv/src/bloc/content_cubit/content_cubit.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/bloc.dart';
import 'package:nrbtv/src/data/models/vod/vod_model.dart';
import 'package:ui_kit/ui_kit.dart';

class ContentListView extends StatefulWidget {
  const ContentListView({
    super.key,
    required this.videos,
    this.headerTitle,
    this.index,
    required this.onTap,
  });
  final List<ContentModel> videos;
  final String? headerTitle;
  final int? index;

  final void Function(BuildContext context, ContentModel vod) onTap;

  @override
  State<ContentListView> createState() => _ContentListViewState();
}

class _ContentListViewState extends State<ContentListView> {
  late List<double> opacities;

  @override
  void initState() {
    super.initState();
    opacities = List<double>.filled(100, 0.0);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (int i = 0; i < opacities.length; i++) {
        Future.delayed(Duration(milliseconds: 200 * i), () {
          if (mounted) {
            setState(() {
              opacities[i] = 1.0;
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UiTvListHeader(
          headerTitle: widget.headerTitle ?? '',
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.videos.length,
            itemBuilder: (context, index) {
              final ContentModel video = widget.videos[index];

              if (video.images.thumbnail == null) {
                return const SizedBox.shrink();
              }

              return AnimatedOpacity(
                opacity: opacities[index],
                duration: Durations.long2,
                curve: Curves.easeInOut,
                child: _AppCard(
                  isSelected: false,
                  onTap: widget.onTap,
                  video: video,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _AppCard extends StatelessWidget {
  const _AppCard({
    required this.video,
    required this.isSelected,
    required this.onTap,
  });
  final ContentModel video;
  final bool isSelected;
  final void Function(BuildContext context, ContentModel vod) onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      isSelected: isSelected,
      onTap: () => _onPressed(context, video),
      onFocus: () => _onFocus(context, video),
      content: Text(
        video.title,
        style: tvCardTextStyle.white,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      image: video.images.thumbnail ?? '',
    );
  }

  void _onPressed(BuildContext context, ContentModel vod) {
    context.read<ContentCubit>().setSelectedContent(vod);
    onTap(context, vod);
  }

  void _onFocus(BuildContext context, ContentModel vod) {
    context.read<ContentCubit>().setSelectedContent(vod);
  }
}
