import 'package:commons/shared/enums.dart';
import 'package:commons/shared/extensions.dart';
import 'package:nrbtv/src/bloc/content_cubit/content_cubit.dart';
import 'package:nrbtv/src/ui/widgets/grid_view_builder.dart';
import 'package:nrbtv/src/ui/widgets/movie_item_builder.dart';
import 'package:nrbtv/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/ui/pages/content_detail/content_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllPage extends StatefulWidget {
  const SeeAllPage({
    super.key,
    required this.typeId,
  });

  static const path = 'see-all-page';
  static const name = 'see-all-page';

  final int typeId;
  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  void _loadMore() {
    // context.read<ContentCubit>().nextPage();
    // context.read<ContentCubit>().getPaginatedListById(id: widget.typeId);
  }

  void _onCardPressed(BuildContext context, ContentModel content) {
    context.pushNamed(
      ContentDetailPage.name,
      extra: {
        'content': content,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasNavbar: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocBuilder<ContentCubit, ContentState>(
            builder: (context, state) {
              List<ContentModel> contentList =
                  state.homePageContent!.values.expand((list) => list).toList();
              final bool showLoadingIndicator = state.status == Status.loading;
              // final bool showButton =
              //     state.hasMorePages && state.status == Status.success;
              return GridViewBuilder(
                itemCount: contentList.length,
                showLoadingIndicator: showLoadingIndicator,
                paginationButton: (
                  visibility: false,
                  callback: () {
                    _loadMore();
                  }
                ),
                itemBuilder: (context, index) {
                  final ContentModel content = contentList[index];
                  return MovieItemBuilder(
                    focusOnItem: index == 0,
                    video: content,
                    callback: () {
                      _onCardPressed(context, content);
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
