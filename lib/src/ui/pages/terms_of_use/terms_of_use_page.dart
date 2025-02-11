import 'package:commons/shared/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:nrbtv/src/index.dart';
import 'package:ui_kit/ui_kit.dart';

final List<Map<String, dynamic>> _terms = [
  {
    'title': '1. AGREE TO PERFORM AND PAY',
    'description':
        'POCKO Channel agrees to perform services defined in the Attached Proposal, and CUSTOMER agrees to pay the fees for the services in the sums described in the Attached Proposal for the TERM of the Agreement.'
  },
  {
    'title': '2. TERM OF AGREEMENT',
    'description':
        'The TERM of this Agreement shall be effective for the TERM specified in the contract unless terminated earlier as provided herein. This Agreement shall automatically renew itself for additional terms equal to the length of the original TERM, unless either party gives the other written notice of its desire not to renew at least: CUSTOMER is responsible for full and total payment of TERM regardless of early termination of services.'
  },
  {
    'title': '3. ENTIRE AGREEMENT',
    'description':
        'The Terms and Conditions contained in this Agreement supersede all prior oral or written understandings between the parties and constitute the entire agreement between them concerning the subject matter of this Agreement and shall not be contradicted, explained or supplemented by any course of dealing POCKO Channel or any of its affiliates and CUSTOMER or any of its affiliates. There are no understandings or representations, express or implied, not expressly set forth in this Agreement. This Agreement shall not be modified or amended except in writing signed by the parties.'
  },
  {
    'title': '4. PROVIDED INFORMATION',
    'description':
        'All materials delivered to POCKO Channel by CUSTOMER ("CUSTOMER"s Material") shall remain the property of CUSTOMER, and POCKO Channel shall not have the right to use the CUSTOMER"s Material except in performing the Development Services for CUSTOMER. The CUSTOMER warrants that all information and any other material provided to POCKO Channel is owned by the CUSTOMER. All Work Product except for the CUSTOMER"s Material shall be the sole property of POCKO Channel, and POCKO Channel reserves all rights in the Work Product, subject to the above license.'
  },
  {
    'title': '5. CORE MODULES',
    'description':
        'POCKO Channel uses core modules of software code to build Programming Code and does not grant CUSTOMER resale or licensing rights to the Programming Code. All Work Product is subject to intellectual property rights reserved by POCKO Channel and/or others as designated by POCKO Channel, and may not be further licensed or transferred to others by CUSTOMER.'
  },
  {
    'title': '6. PRICE VARIANCE',
    'description':
        'POCKO Channel price is subject to a variance of fifteen percent (15%) due to the interactive nature of creative, technical, and other development work for fixed-price, fixed-hour quote, or other estimated pricing. Costs for equipment may change due to market conditions and POCKO Channel agrees to promptly provide CUSTOMER notice of any such price changes. Unless noted otherwise, fixed-price estimates are subject to change by POCKO Channel if the requirements of the services to be performed change during the project based upon POCKO Channel understanding.'
  },
  {
    'title': '7. CANCELLATION',
    'description':
        'CUSTOMER is responsible for full payment of TERM regardless of early termination. Account cancellation should be done by canceling subscription. Account will be automatically deactivated end of service term. All payments are non-refundable.'
  },
  {
    'title': '8. DENIAL OF SERVICE',
    'description':
        'We reserve the right to refuse service to anyone at any time for any reason.'
  },
  {
    'title': '',
    'description':
        'You can request by contacting us whether we are keeping personal data about you. We do, however, allow you to challenge our decision to refuse to provide you with a copy of your personal data.'
  }
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
            page: 'Terms Of Use',
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
                      _controller.animateTo(_controller.offset + 200,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    }

                    if (e.logicalKey == LogicalKeyboardKey.arrowUp) {
                      _controller.animateTo(_controller.offset - 200,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        policy['title'],
                        style: TextStyles.h5.surface(context),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 10),
                      Text(policy['description'],
                          style: TextStyles.bodyMedium.surface(context)),
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
