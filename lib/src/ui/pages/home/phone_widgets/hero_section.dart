part of '../home_page.dart';

class _HeroSection extends StatefulWidget {
  const _HeroSection();

  @override
  State<_HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<_HeroSection> {
  @override
  void initState() {
    Future.microtask(() {
      final cubit = context.read<ContentCubit>();

      if (cubit.state.selectedVideo != null) return;

      if (cubit.state.homePageContent != null &&
          cubit.state.homePageContent!.isNotEmpty) {
        cubit.setSelectedContent(
            cubit.state.homePageContent!.values.first.first);
      }

      // final HomeCubit homeCubit = context.read<HomeCubit>();

      // if (homeCubit.state.selectedChannel != null) return;

      // homeCubit.setSelectedChannel(
      //   context.read<ChannelCubit>().state.channels.isEmpty
      //       ? ChannelModel.empty
      //       : context.read<ChannelCubit>().state.channels.first,
      // );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ContentCubit, ContentState, ContentModel?>(
      selector: (state) {
        return state.selectedVideo;
      },
      builder: (context, state) {
        final state = context.watch<ContentCubit>().state;
        final bool isLoading =
            state.homePageContent == null || state.homePageContent!.isEmpty;

        return isLoading
            ? const Center(
                child: SizedBox.shrink(),
              )
            : AnimatedSwitcher(
                duration: Durations.extralong4,
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                child: _ImageHero(
                  channels: state.homePageContent!,
                ),
              );
      },
    );
  }
}
