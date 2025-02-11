part of 'widgets.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({
    super.key,
    required this.content,
  });

  final ContentModel content;

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  void initState() {
    fetchTokenAndDefineUrl();
    super.initState();
  }

  String? deviceInfo;

  String? aToken;

  String link = '';

  fetchTokenAndDefineUrl() async {
    final AuthRepository authRepo = context.read<AuthRepository>();
    final DeviceModelService dmc = DeviceModelService();
    aToken = await authRepo.getToken();
    deviceInfo = await dmc.deviceModel;

    link = widget.content.sources.getPreferredVideoSource() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Durations.extralong4,
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      child: _ImageHero(
        // ignore: prefer_null_aware_operators

        content: widget.content,
      ),
    );
  }
}
