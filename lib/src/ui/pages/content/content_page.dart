import 'package:nrbtv/src/ui/pages/content/mobile_content/mobile_content_page.dart';
import 'package:flutter/material.dart';

import 'package:nrbtv/src/index.dart';
import 'package:nrbtv/src/ui/pages/vod/phone_widgets/widgets.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key, required this.contentTypeIndex});
  final int contentTypeIndex;

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return DeviceWrapper(
      tvWidget: ContentTvView(contentType: widget.contentTypeIndex),
      widget: const MobileContentPage(),
    );
  }
}
