import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nrbtv/src/index.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:ui_kit/widgets/app_modal.dart';

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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Text('Archive', style: TextStyles.h5),
              Spacer(),
              DropDownDvr(),
            ],
          ),
        ),
        SizedBox(
          height: 400,
          child: ListView.builder(
            itemCount: itemCount,
            padding: const EdgeInsets.only(bottom: 100),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return const Padding(
                  padding: EdgeInsets.only(bottom: 5), child: _InfoRowEpg());
            },
          ),
        ),
      ],
    );
  }
}

class _InfoRowEpg extends StatelessWidget {
  const _InfoRowEpg();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: InkWell(
        onTap: () {
          // TODO: handle loading url
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

class DropDownDvr extends StatefulWidget {
  const DropDownDvr({super.key});

  @override
  State<DropDownDvr> createState() => _DropDownDvrState();
}

class _DropDownDvrState extends State<DropDownDvr> {
  final List<String> _days = [
    'Nov 21, 2024',
    'Nov 20, 2024',
    'Nov 19, 2024',
    'Nov 18, 2024',
    'Nov 17, 2024',
    'Nov 16, 2024',
    'Nov 15, 2024',
    'Nov 14, 2024',
    'Nov 13, 2024',
  ];

  String? selectedDay;

  @override
  void initState() {
    super.initState();
    selectedDay = _days.first;
  }

  bool isAccessable(int index) {
    return index > 6;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedDay,
      onChanged: (String? newValue) {
        if (newValue != null) {
          int index = _days.indexOf(newValue);
          if (isAccessable(index)) {
            _buildLoginModal();
          } else {
            setState(() {
              selectedDay = newValue;
            });
          }
        }
      },
      items: _days.asMap().entries.map((entry) {
        int index = entry.key;
        String day = entry.value;

        return DropdownMenuItem<String>(
          value: day,
          child: isAccessable(index)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(day, style: TextStyles.bodyMedium),
                    Text(
                      'Login to Watch',
                      style: TextStyles.bodyMedium
                          .copyWith(color: context.uiColors.primary),
                    ),
                  ],
                )
              : Text(day, style: TextStyles.bodyMedium),
        );
      }).toList(),
    );
  }

  void _buildLoginModal() {
    showDialog(
        context: context,
        builder: (context) {
          return AppModal(
            title: 'You need to login to access VODs beyond 7 days',
            label: 'Do you want to login?',
            imageColor: context.uiColors.primary,
            children: [
              AppButton.primary(
                label: 'Cancel',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Margins.horizontal10,
              AppButton.primary(
                label: 'Login',
                onPressed: () {
                  Navigator.of(context).pop();
                  context.pushNamed(LoginPage.path);
                },
              )
            ],
          );
        });
  }
}
