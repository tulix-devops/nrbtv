part of '../home_page.dart';

class _VideoHero extends StatefulWidget {
  const _VideoHero({
    required this.channelThumbnail,
    required this.channelTitle,
    required this.isLive,
  });

  final String? channelThumbnail;
  final String? channelTitle;
  final bool isLive;
  @override
  State<_VideoHero> createState() => _VideoHeroState();
}

class _VideoHeroState extends State<_VideoHero> {
  @override
  Widget build(BuildContext context) {
    final bool isTv = context.isTv;
    // final StorageRecordModel channel = context.read<HomeCubit>().state.selectedChannel!.storageRecord;
    // final ChannelModel channel =
    //     context.read<HomeCubit>().state.selectedChannel!;

    return Padding(
      padding: isTv
          ? const EdgeInsets.fromLTRB(100, 10, 100, 0)
          : const EdgeInsets.fromLTRB(15, 70, 15, 15),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                ),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        widget.channelTitle ?? '',
                        style: TextStyles.bodyLargeBold.copyWith(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const Spacer(),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.uiColors.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Text(
                          'LIVE',
                          style: TextStyles.bodySmall.white,
                        ),
                      ),
                    ),
                  ],
                )),
            // ClipRRect(
            //   borderRadius: const BorderRadius.all(Radius.circular(2)),
            //   child: AppVideoPlayer(
            //     video: ContentModel.empty,
            //     image: channel.banner,
            //     link: channel.source,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
