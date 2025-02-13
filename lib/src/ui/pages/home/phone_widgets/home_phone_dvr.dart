import 'package:flutter/material.dart';
import 'package:nrbtv/src/ui/pages/home/widgets/list_header.dart';
import 'package:ui_kit/ui_kit.dart';

class HomePhoneDvr extends StatefulWidget {
  const HomePhoneDvr({super.key});

  @override
  State<HomePhoneDvr> createState() => _HomePhoneDvrState();
}

class _HomePhoneDvrState extends State<HomePhoneDvr> {
  final int itemCount = 10;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListHeader(headerTitle: 'Archive'),
        SizedBox(
          height: 400,
          child: ListView.builder(
            itemCount: itemCount,
            padding: const EdgeInsets.only(bottom: 100),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return const Padding(
                  padding: EdgeInsets.only(bottom: 5), child: _InfoRow());
            },
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: InkWell(
        onTap: () {
          // TODO: handle
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Image.asset(Assets.nrbLogo)),
            Text(
              'Alex McFarland Show',
              style: TextStyles.bodyMediumBold,
            ),
            const SizedBox(
              width: 18,
            ),
            const Text(
              '10:00pm - 10:30pm(EST)',
              style: TextStyles.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
