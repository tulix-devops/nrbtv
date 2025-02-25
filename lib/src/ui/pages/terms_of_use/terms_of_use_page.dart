import 'package:commons/shared/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:nrbtv/src/index.dart';
import 'package:ui_kit/ui_kit.dart';

final List<Map<String, dynamic>> _terms = [
  {
    'description':
        'NRBTV, a trusted source for faith-based television, is excited to announce its addition to the DISH Network lineup on channel 274. This milestone expands NRBTV\'s reach, providing more households across the United States access to our unique, Christ-centered programming.'
  },
  {
    'description':
        'Since its founding in 2005, NRBTV has been committed to delivering high-quality, faith-based content that helps viewers learn, know, apply, share, and live God\'s truth. By joining DISH Network\'s channel lineup, NRBTV continues to fulfill its mission of impacting culture through Christian television.'
  },
  {
    'description':
        '“Our partnership with DISH Network allows us to bring transformative programming to an even wider audience,” said NRBTV President and CEO Troy A. Miller. "We\'re thrilled to offer DISH viewers engaging content that inspires and encourages viewers to put their faith into practice."'
  },
  {
    'description':
        'DISH customers can now tune in to channel 274 to enjoy NRBTV\'s diverse lineup of inspirational programming, featuring Christian teaching, preaching, apologetics, and educational content—a unique blend that rivals leading educational networks while maintaining a distinctly Christian perspective.'
  },
  {
    'description':
        'This expansion marks another milestone in NRBTV\'s mission to impact culture through Christian television. Don\'t miss out—tune in today and be encouraged in your faith!'
  },
];

class TermsOfUsePage extends StatefulWidget {
  const TermsOfUsePage({super.key});

  static const path = 'terms-of-use';
  static const name = 'terms-of-use';

  @override
  State<TermsOfUsePage> createState() => _TermsOfUsePageState();
}

class _TermsOfUsePageState extends State<TermsOfUsePage> {
  late final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasNavbar: false,
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          PageHeader(
            isTv: context.isTv,
            onPressed: () {
              context.pop();
            },
            isMainPage: false,
            page: 'About Us',
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            sliver: SliverList.builder(
              itemCount: _terms.length + 1,
              itemBuilder: (context, index) {
                if (index == _terms.length) {
                  return const SizedBox(height: 100);
                }

                final Map<String, dynamic> policy = _terms[index];

                return KeyboardListener(
                  focusNode: FocusNode(),
                  onKeyEvent: (e) {
                    if (e.logicalKey == LogicalKeyboardKey.arrowDown) {
                      if (_controller.offset ==
                          _controller.position.maxScrollExtent) {
                        return;
                      }
                      _controller.animateTo(_controller.offset + 200,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    }

                    if (e.logicalKey == LogicalKeyboardKey.arrowUp) {
                      if (_controller.offset == 0.00) {
                        return;
                      }
                      _controller.animateTo(_controller.offset - 200,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(policy['description'],
                          style: TextStyles.bodyLarge.surface(context)),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
