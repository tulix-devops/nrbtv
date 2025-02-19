part of '../home_page.dart';

class _HeroSection extends StatefulWidget {
  const _HeroSection({
    required this.video,
  });

  final TvScheduleModel video;

  @override
  State<_HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<_HeroSection> {
  @override
  Widget build(BuildContext context) {
    return MobilePlayerContainer(
      key: ValueKey(widget.video.link),
      video: widget.video,
    );
  }
}
