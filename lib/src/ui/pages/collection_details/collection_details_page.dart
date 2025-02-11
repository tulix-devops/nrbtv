import 'package:commons/http/custom_http_client.dart';
import 'package:commons/shared/enums.dart';
import 'package:commons/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/collection_cubit/collection_cubit.dart';
import 'package:nrbtv/src/data/models/collection/collection_model.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/index.dart';
import 'package:nrbtv/src/ui/pages/content_detail/content_detail_page.dart';
import 'package:nrbtv/src/ui/widgets/grid_view_builder.dart';
import 'package:nrbtv/src/ui/widgets/movie_item_builder.dart';

class CollectionDetailsPageProvider extends StatelessWidget {
  const CollectionDetailsPageProvider(
      {super.key, this.collectionTitle, required this.collectionModel});
  static const path = 'collection-details-page';
  static const name = 'collection-details-page';
  final String? collectionTitle;
  final CollectionModel collectionModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CollectionCubit>(
      create: (context) => CollectionCubit(
        collectionRepository: CollectionRepositoryImpl(
          collectionRemoteRepository: CollectionRemoteDataSource(
            context.read<CustomHTTPClient>(),
          ),
        ),
      ),
      child: CollectionDetailsPage(
        collectionModel: collectionModel,
        collectionTitle: collectionTitle,
      ),
    );
  }
}

class CollectionDetailsPage extends StatefulWidget {
  const CollectionDetailsPage(
      {super.key, this.collectionTitle, required this.collectionModel});

  static const path = 'collection-details-page';
  static const name = 'collection-details-page';
  final String? collectionTitle;
  final CollectionModel collectionModel;
  @override
  State<CollectionDetailsPage> createState() => _CollectionDetailsPageState();
}

class _CollectionDetailsPageState extends State<CollectionDetailsPage> {
  @override
  void initState() {
    context.read<CollectionCubit>().reset();
    context.read<CollectionCubit>().fetchContent(
          collectionId: widget.collectionModel.id,
          limit: 15,
        );
    super.initState();
  }

  void _onCardPressed(BuildContext context, ContentModel content) {
    context.pushNamed(
      ContentDetailPage.name,
      extra: {
        'content': content,
      },
    );
  }

  void _loadMore() {
    context.read<CollectionCubit>().nextPage();
    context.read<CollectionCubit>().fetchContent(
          collectionId: widget.collectionModel.id,
          limit: 1,
        );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasNavbar: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocBuilder<CollectionCubit, CollectionState>(
            builder: (context, state) {
              List<ContentModel> contentList = state.contentList;
              final bool showLoadingIndicator = state.status == Status.loading;
              final bool showButton =
                  state.hasMorePages && state.status == Status.success;

              return GridViewBuilder(
                  itemCount: contentList.length,
                  itemBuilder: (context, index) {
                    final ContentModel content = contentList[index];
                    return MovieItemBuilder(
                      focusOnItem: index == 0,
                      callback: () {
                        _onCardPressed(context, content);
                      },
                      video: content,
                    );
                  },
                  showLoadingIndicator: showLoadingIndicator,
                  paginationButton: (
                    visibility: showButton,
                    callback: () {
                      _loadMore();
                    }
                  ));
            },
          ),
        ),
      ),
    );
  }
}
