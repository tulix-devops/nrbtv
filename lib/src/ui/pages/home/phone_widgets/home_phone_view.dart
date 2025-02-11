import 'package:commons/shared/extensions.dart';
import 'package:nrbtv/src/bloc/content_cubit/content_cubit.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/index.dart';
import 'package:nrbtv/src/ui/pages/content_detail/content_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/ui/pages/home/widgets/list_header.dart';
import 'package:nrbtv/src/ui/pages/pages.dart';
import 'package:ui_kit/ui_kit.dart';

class HomePhoneView extends StatelessWidget {
  const HomePhoneView({super.key, required this.controller});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContentCubit, ContentState>(
      builder: (context, state) {
        final bool isLoading =
            state.homePageContent == null || state.homePageContent!.isEmpty;

        return isLoading
            ? const Center(child: AppLoadingIndicator(size: 70))
            : Column(
                children: [
                  for (final entry in state.homePageContent!.entries)
                    _ContentListView(
                      vodCategoryTitle: entry.key,
                      videos: entry.value,
                    ),
                  const SizedBox(height: 100)
                ],
              );
      },
    );
  }
}

class _ContentListView extends StatelessWidget {
  const _ContentListView({
    required this.videos,
    required this.vodCategoryTitle,
  });
  final List<ContentModel> videos;
  final String vodCategoryTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Margins.vertical10,
        ListHeader(
          headerTitle: vodCategoryTitle,
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: videos.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final ContentModel video = videos[index];

              final double leftPadding = index != 0 ? 0 : 10;

              final double rightPadding = index == videos.length - 1 ? 15 : 0;

              return Padding(
                padding: EdgeInsets.only(
                  left: leftPadding,
                  right: rightPadding,
                ),
                child: AppCard(
                  onTap: () => _onPressed(context, video, index),
                  content: Text(
                    video.title,
                    style: cardTextStyle.white,
                  ),
                  image: video.images.getThumbnail(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Navigate to the video detail page
  void _onPressed(BuildContext context, ContentModel video, int index) {
    context.pushNamed(
      MobileContentDetailPage.name,
      extra: {
        'content': video,
      },
    );
  }
}
