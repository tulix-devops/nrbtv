import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:nrbtv/src/bloc/search_page_filter/search_filter_bloc.dart';
import 'package:nrbtv/src/index.dart';

import '../auth/widgets/tv_auth_scaffold.dart';

class TvSearchInputPage extends StatefulWidget {
  const TvSearchInputPage({
    super.key,
  });

  static const path = 'tv-input';
  static const name = 'tv-input';

  @override
  State<TvSearchInputPage> createState() => _TvSearchInputPageState();
}

class _TvSearchInputPageState extends State<TvSearchInputPage> {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TvAuthScaffold(
      pageTitle: 'Search Page',
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.dark2,
              borderRadius: BorderRadius.circular(8),
            ),
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Margins.vertical16,
                AppKeyboard.text(
                  onChanged: (value) {
                    textController.text = textController.text + value;
                    context.read<SearchFilterBloc>().add(
                        SearchFilterEvent.searchFilterChanged(
                            textController.text));
                  },
                  onDeleted: () {
                    textController.text = textController.text.substring(
                      0,
                      textController.text.length - 1,
                    );
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Margins.horizontal10,
                    Expanded(
                      child: AppButton.primary(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        label: 'Submit',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: AppInput.none(
                prefixIcon: Assets.searchIcon,
                hintText: 'Search',
                controller: textController,
                value: textController.text,
                isDeviceTv: context.isTv,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
