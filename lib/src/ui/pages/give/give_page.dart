import 'package:flutter/material.dart';
import 'package:nrbtv/src/core/core.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:url_launcher/url_launcher.dart';

const String _donationInfo =
    'In addition to donating online, you may make your tax-deductible contribution by phone at 1-800-895-6722, as well as text NRBTV to 206-859-9405. You may also mail your check or money order to us at';
const String _corporateInfo =
    'When you sponsor the work of NRBTV, you help others learn, apply, and share God\'s Word by supporting quality programs that feature respected Bible teachers, apologists, and scholars. Your partnership also helps build your brand and grow your business with on-air and online exposure to a loyal, Christian viewing audience.';

const EdgeInsets padding = EdgeInsets.all(12);

class GivePage extends StatelessWidget {
  const GivePage({super.key});

  static const path = 'give-page';
  static const name = 'give-page';

  @override
  Widget build(BuildContext context) {
    List<String> addressList = [
      'NRBTV Viewer Support',
      'PO Box 77704',
      'Washington, DC 20013',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: CustomScrollView(
        slivers: [
          PageHeader(
            isTv: context.isTv,
            onPressed: () {},
            isMainPage: true,
            page: 'Give by Phone or Mail',
          ),
          SliverToBoxAdapter(
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () => _launchURL('https://nrbtv.org/donate/'),
              child: const _AboutText(
                hasLink: true,
                text: _donationInfo,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final address in addressList)
                  Text(
                    address,
                    style: TextStyles.bodyLargeBold
                        .copyWith(color: AppColors.greyscale[500]),
                  )
              ],
            ),
          ),
          PageHeader(
            titlePadding: EdgeInsets.zero,
            onPressed: () {},
            isMainPage: true,
            isTv: context.isTv,
            page: 'Corporate Sponsorship',
          ),
          const SliverToBoxAdapter(
            child: _AboutText(
              text: _corporateInfo,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              'To learn more, download our information sheet or contact Christy Roberts at croberts@nrbtv.org or (615) 733-2960.',
              style: TextStyles.bodyLargeBold
                  .copyWith(color: AppColors.greyscale[500]),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
            ),
          )
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class _AboutText extends StatelessWidget {
  const _AboutText({required this.text, this.hasLink = false});

  final String text;
  final bool hasLink;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.h6
          .copyWith(color: hasLink ? context.uiColors.primary : null),
    );
  }
}
