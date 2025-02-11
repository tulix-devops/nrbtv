import 'package:commons/commons.dart';
import 'package:nrbtv/src/bloc/content_cubit/content_cubit.dart';
import 'package:nrbtv/src/core/services/device_model_service.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/data/models/content/seasons_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nrbtv/src/data/data.dart';
import 'package:nrbtv/src/ui/widgets/widgets.dart';
import 'package:local_storage/local_storage.dart';
import 'package:ui_kit/ui_kit.dart';

import 'widgets/widgets.dart';

class MobileContentDetailPage extends StatelessWidget {
  const MobileContentDetailPage({super.key, required this.content});
  static const path = 'mobile-content-detail';
  static const name = 'mobile-content-detail';

  final ContentModel content;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContentCubit(
        contentLocalDataSource: ContentLocalDataSource(
          context.read<LocalStorage>(),
        ),
        contentRemoteRepository: ContentRepositoryImpl(
          contentRemoteRepository:
              ContentRemoteDataSource(context.read<CustomHTTPClient>()),
        ),
      ),
      child: _View(
        content: content,
      ),
    );
  }
}

class _View extends StatefulWidget {
  const _View({
    required this.content,
  });

  final ContentModel content;

  @override
  State<_View> createState() => __ViewState();
}

class __ViewState extends State<_View> {
  ContentModel? selectedContent;

  late final ScrollController _controller = ScrollController();

  @override
  void initState() {
    context.read<ContentCubit>().fetchRelatedContent(
          widget.content.typeId!,
          widget.content.id,
        );

    // context.read<VodCubit>().reset();
    // context.read<RelatedVodCubit>().fetchRelatedContent(widget.content.id);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onContentSelected(ContentModel e) {
    setState(() {
      selectedContent = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ContentModel content = widget.content;
    return AppScaffold(
      hasNavbar: false,
      body: BlocBuilder<ContentCubit, ContentState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: _controller,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderSection(
                      content: content,
                    ),
                    const SizedBox(height: 16),
                    TitleRowWithRatingWidget(
                      content: content,
                    ),
                    TagsWidget(
                      attributes: content.attributes!,
                      isTv: false,
                    ),
                    const SizedBox(height: 24),
                    _ContentDescription(
                      content: content,
                      onEpisodeSelected: onContentSelected,
                    ),
                    const SizedBox(height: 20),
                    _RelatedContent(
                      contentList:
                          context.read<ContentCubit>().state.relatedContent!,
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
                AppBar(
                  forceMaterialTransparency: true,
                  titleSpacing: 0,
                  title: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.sizeOf(context).width / 1.65),
                    child: Center(
                      child: Image.asset(
                        Assets.enSplashScreenLogo,
                        height: 40,
                        width: 60,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _RelatedContent extends StatelessWidget {
  const _RelatedContent({
    required this.contentList,
  });

  final List<ContentModel> contentList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Related content',
            style: TextStyles.h4.surface(context),
          ),
          Margins.vertical20,
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (context, index) {
                final ContentModel content = contentList[index];

                return AppCard(
                  image: content.images.getThumbnail(),
                  onTap: () => _onPressed(
                    context,
                    content,
                  ),
                  content: Text(
                    content.title,
                    style: TextStyles.bodyLargeMedium.surface(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onPressed(BuildContext context, ContentModel content) {
    context.pushNamed(
      MobileContentDetailPage.name,
      extra: {
        'content': content,
      },
    );
  }
}

class _ContentDescription extends StatelessWidget {
  const _ContentDescription({
    required this.content,
    this.onEpisodeSelected,
  });

  final ContentModel content;
  final Function(ContentModel)? onEpisodeSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Text(
            content.description ?? '',
            style: TextStyles.bodyMedium.surface(context),
          ),
        ),
        if (content.seasons != null)
          SeriesSwiper(
            seasons: content.seasons!,
            data: content,
            onEpisodeSelected: (ContentModel selectedcontent) {
              onEpisodeSelected!(selectedcontent);
            },
          ),
        if (content.seasons != null)
          SeriesSwiper(
            seasons: content.seasons!,
            data: content,
            onEpisodeSelected: (ContentModel selectedcontent) {
              onEpisodeSelected!(selectedcontent);
            },
          ),
      ],
    );
  }
}

class TitleRowWithRatingWidget extends StatefulWidget {
  const TitleRowWithRatingWidget({super.key, required this.content});
  final ContentModel content;

  @override
  State<TitleRowWithRatingWidget> createState() =>
      _TitleRowWithRatingWidgetState();
}

class _TitleRowWithRatingWidgetState extends State<TitleRowWithRatingWidget> {
  late FlexibleBottomSheetController _animatedShowRatingBottomSheet;

  @override
  void initState() {
    _animatedShowRatingBottomSheet = FlexibleBottomSheetController();
    super.initState();
  }

  Future<void> showRatingModal() {
    return FlexibleBottomSheet.show(
      context: context,
      bottomSheetController: _animatedShowRatingBottomSheet,
      onClose: () {},
      //Add Overlay Here If needed
      overlayWidget: const SizedBox.shrink(),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // RatingBottomSheet(bottomSheetController: _animatedShowRatingBottomSheet),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.content.title,
              style: TextStyles.bodyLargeBold.copyWith(
                fontSize: 24,
                color: context.uiColors.onSurface,
              ),
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
