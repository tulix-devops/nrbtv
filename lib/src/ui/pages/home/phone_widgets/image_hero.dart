part of '../home_page.dart';

class _ImageHero extends StatefulWidget {
  const _ImageHero({
    required this.channels,
  });

  final Map<String, List<ContentModel>> channels;

  @override
  State<_ImageHero> createState() => _ImageHeroState();
}

class _ImageHeroState extends State<_ImageHero> {
  late final PageController _pageController;
  late final FocusNode buttonFocus;

  @override
  void initState() {
    buttonFocus = FocusNode();
    _pageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    buttonFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<ContentModel> allChannels =
        widget.channels.values.expand((list) => list).toList();

    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: allChannels.length,
            itemBuilder: (context, i) {
              final channel = allChannels[i];

              return GestureDetector(
                onTap: () {
                  context.read<ContentCubit>().setSelectedContent(channel);
                },
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return AppColors.homePageMask.createShader(bounds);
                      },
                      blendMode: BlendMode.srcATop,
                      child: _ImageSwitcher(
                        // channelThumbnail: widget.channels[i].storage.record.thumb ?? "",
                        channelThumbnail: channel.images.thumbnail ?? '',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 24),
                      child: _HeroContent(
                        buttonFocus: buttonFocus,
                        channel: channel,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned.fill(
            child: Center(
              child: UiSliderIndicator(
                buttonFocus: buttonFocus,
                pageController: _pageController,
                sliderCount: allChannels.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageSwitcher extends StatelessWidget {
  const _ImageSwitcher({
    required this.channelThumbnail,
  });

  final String channelThumbnail;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Durations.long2,
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.linear,
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Image.network(
          channelThumbnail,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent({
    required this.buttonFocus,
    required this.channel,
  });

  final FocusNode buttonFocus;
  final ContentModel channel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                channel.title,
                style: TextStyles.h4.white,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Margins.horizontal10,
            DecoratedBox(
              decoration: BoxDecoration(
                color: context.uiColors.primary,
                borderRadius: BorderRadius.circular(4),
              ),
            )
          ],
        ),
        Margins.vertical10,
        AppChip.smallPrimaryRounded(
          isOutlined: true,
          focusNode: buttonFocus,
          label: 'Watch',
          onPressed: () {
            context.pushNamed(
              VideoPlayerPage.name,
              extra: {'contentModel': channel, 'isTrailer': false},
            );
            context.read<ContentCubit>().setSelectedContent(channel);
          },
          prefixIcon: (asset: Assets.play, size: null),
        ),
      ],
    );
  }
}
