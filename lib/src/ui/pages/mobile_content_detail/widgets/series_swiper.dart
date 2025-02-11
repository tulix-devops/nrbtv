part of 'widgets.dart';

class SeriesSwiper extends StatefulWidget {
  const SeriesSwiper({
    super.key,
    required this.seasons,
    required this.data,
    required this.onEpisodeSelected,
  });
  final Map<int, SeasonModel> seasons;
  final ContentModel data;
  final void Function(ContentModel selectedepisode) onEpisodeSelected;

  @override
  State<SeriesSwiper> createState() => _SeriesSwiperState();
}

class _SeriesSwiperState extends State<SeriesSwiper> {
  bool _isExpanded = false;
  late int _selectedSeasonKey = widget.seasons.keys.first;
  int _selectedEpisodeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Episodes',
                style: TextStyles.h4,
              ),
              FocusTextButton(
                useDefaultButtonStyle: true,
                iconColor: (
                  defaultColor: context.uiColors.primary,
                  focusedColor: context.uiColors.primary
                ),
                onPressed: (_) {
                  setState(() => _isExpanded = !_isExpanded);
                },
                icon: _isExpanded ? Assets.arrowUp : Assets.arrowDown,
                focusNode: FocusNode(),
              ),
            ],
          ),
          if (_isExpanded) ...[
            _SeasonsList(
              seasons: widget.seasons,
              selectedSeasonKey: _selectedSeasonKey,
              onSeasonSelected: (key) {
                setState(() {
                  _selectedSeasonKey = key;
                  _selectedEpisodeIndex = 0;
                });
              },
            ),
          ],
          const SizedBox(height: 10),
          _EpisodesGrid(
            episodes: widget.seasons[_selectedSeasonKey]!,
            selectedEpisodeIndex: _selectedEpisodeIndex,
            onEpisodeSelected: (video, index) {
              setState(() {
                widget.onEpisodeSelected(video);
                _selectedEpisodeIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _SeasonsList extends StatelessWidget {
  final Map<int, SeasonModel> seasons;
  final int selectedSeasonKey;
  final Function(int) onSeasonSelected;

  const _SeasonsList({
    required this.seasons,
    required this.selectedSeasonKey,
    required this.onSeasonSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (final entry in seasons.keys)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: AppChip.mediumPrimaryRounded(
                isOutlined: selectedSeasonKey != entry,
                label: entry.toString(),
                onPressed: () => onSeasonSelected(entry),
                color: context.uiColors.primary,
              ),
            ),
        ],
      ),
    );
  }
}

class _EpisodesGrid extends StatelessWidget {
  final SeasonModel episodes;
  final int selectedEpisodeIndex;
  final Function(ContentModel, int) onEpisodeSelected;

  const _EpisodesGrid({
    required this.episodes,
    required this.selectedEpisodeIndex,
    required this.onEpisodeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: episodes.episodes.length,
        itemBuilder: (context, index) {
          final ContentModel video = episodes.episodes.values.elementAt(index);
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 0 : 10, right: 10),
            child: InkWell(
              onTap: () => onEpisodeSelected(video, index),
              child: AppCard(
                extraPositionedChildren: const [
                  Positioned(
                    top: 50,
                    left: 0,
                    right: 0,
                    child: AppIcon(
                      Assets.play,
                      height: 48,
                      width: 48,
                    ),
                  )
                ],
                isSelected: selectedEpisodeIndex == index,
                content: Text(
                  'Episode ${video.seasons}: ${video.title}',
                  style: cardTextStyle.white,
                ),
                image: video.images.thumbnail ?? '',
              ),
            ),
          );
        },
      ),
    );
  }
}
