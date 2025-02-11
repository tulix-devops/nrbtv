import 'package:commons/commons.dart';
import 'package:nrbtv/src/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/data/models/content/content_type_list_model.dart';

part 'content_state.dart';
part 'content_cubit.freezed.dart';

class ContentCubit extends Cubit<ContentState> {
  ContentCubit(
      {required ContentLocalDataSource contentLocalDataSource,
      required ContentRepository contentRemoteRepository})
      : _contentRemoteRepository = contentRemoteRepository,
        _contentLocalDataSource = contentLocalDataSource,
        super(const ContentState());

  final ContentRepository _contentRemoteRepository;
  final ContentLocalDataSource _contentLocalDataSource;

  Future<void> getHomeContent() async {
    emit(
      state.copyWith(homePageStatus: Status.success),
    );
    final response = await _contentRemoteRepository
        .getFeaturedList(ContentType.channel.value);
    (switch (response) {
      SuccessModel<ContentListModel>() => {
          emit(
            state.copyWith(
              homePageContent: response.data.featureList,
              homePageStatus: Status.success,
            ),
          )
        },
      _ => emit(state.copyWith(status: Status.failure)),
    });
  }

  Future<void> fetchRelatedContent(int typeId, int contentId) async {
    emit(state.copyWith(status: Status.loading));
    final ResponseModel<ContentListModel> response =
        await _contentRemoteRepository.getRelatedContentById(typeId, contentId);

    (switch (response) {
      SuccessModel<ContentListModel>() => {
          emit(
            state.copyWith(
              status: Status.success,
              relatedContent: response.data.contents,
            ),
          ),
        },
      FailureModel<ContentListModel>() => {
          emit(state.copyWith(
            status: Status.failure,
          )),
        },
      AuthenticationFailureModel<ContentListModel>() => emit(state.copyWith(
          status: Status.authenticationFailure,
        )),
      _ => emit(state.copyWith(
          status: Status.serverFailure,
        )),
    });
  }

  void nextPage() {
    emit(
      state.copyWith(
        contentStatus: Status.loading,
        page: state.page + 1,
      ),
    );
  }

  Future<void> getContentListByCategory(int typeId, int categoryId) async {
    if (!isClosed) {
      emit(state.copyWith(contentStatus: Status.loading));
    }
    ContentListCategoryParams params = ContentListCategoryParams(
      typeId: typeId,
      categoryId: categoryId,
    );

    final Map<String, List<ContentModel>>? cachedContentList =
        await _contentLocalDataSource.getContentList();

    if (cachedContentList != null &&
        cachedContentList['$categoryId'] != null &&
        cachedContentList['$categoryId']!.isNotEmpty) {
      emit(state.copyWith(
        mainPageContent: cachedContentList['$categoryId']!,
        contentStatus: Status.success,
        selectedVideo: cachedContentList['$categoryId']?.first,
      ));
      return;
    }

    final ResponseModel<ContentListModel> result =
        await _contentRemoteRepository.getContentListByCategory(params);

    print(result);

    if (!isClosed) {
      (switch (result) {
        SuccessModel<ContentListModel>() => {
            emit(
              state.copyWith(
                contentStatus: Status.success,
                mainPageContent: result.data.contents ?? [],
                selectedVideo: result.data.contents?.first,
              ),
            ),
            await _contentLocalDataSource.storeContentList({
              '$categoryId': result.data.contents ?? [],
            })
          },
        _ => emit(state.copyWith(status: Status.failure)),
      });
    }
  }

  Future<void> getContentList(int typeId) async {
    if (!isClosed) {
      emit(state.copyWith(contentStatus: Status.loading));
    }

    // final Map<String, List<ContentModel>>? cachedContentList =
    //     await _contentLocalDataSource.getContentList();

    // if (cachedContentList != null &&
    //     cachedContentList['$categoryId'] != null &&
    //     cachedContentList['$categoryId']!.isNotEmpty) {
    //   emit(state.copyWith(
    //     mainPageContent: cachedContentList['$categoryId'],
    //     contentStatus: Status.success,
    //     selectedVideo: cachedContentList['$categoryId']?.first,
    //   ));
    //   return;
    // }

    ContentListParams params = ContentListParams(
      typeId: typeId,
      page: state.page,
    );
    final ResponseModel<ContentListModel> result =
        await _contentRemoteRepository.getContentList(params);

    if (!isClosed) {
      (switch (result) {
        PaginatedModel<ContentListModel>() => {
            if (result.data.contents != null &&
                result.data.contents!.isNotEmpty)
              {
                emit(
                  state.copyWith(
                    contentStatus: Status.success,
                    mainPageContent: [
                      ...state.mainPageContent!,
                      ...result.data.contents!
                    ],
                    selectedVideo: result.data.contents?.first,
                    hasMorePages: result.links.next != null,
                  ),
                ),
              }
            else
              {
                emit(state.copyWith(
                  contentStatus: Status.success,
                  hasMorePages: false,
                ))
              }

            // await _contentLocalDataSource.storeContentList({
            //   '$categoryId': result.data.contents ?? [],
            // })
          },
        _ => emit(state.copyWith(status: Status.failure)),
      });
    }
  }

  Future<void> getCategoryList(int categoryID) async {
    if (!isClosed) {
      emit(state.copyWith(categoryStatus: Status.loading));
    }

    final result = await _contentRemoteRepository.getCategoryById(categoryID);

    if (!isClosed) {
      (switch (result) {
        SuccessModel<ContentTypeListModel>() => {
            emit(
              state.copyWith(
                  categoryStatus: Status.success, category: result.data),
            ),
          },
        _ => emit(state.copyWith()),
      });
    }
  }

  void updateSelectedContent(ContentType type) {
    emit(
      state.copyWith(
        selectedContent: type,
      ),
    );
  }

  void reset() {
    emit(
      state.copyWith(
        status: Status.initial,
        categoryStatus: Status.initial,
        contentStatus: Status.initial,
        selectedVideo: null,
        mainPageContent: [],
        categoryData: {},
        hasMorePages: false,
        page: 1,
        category: null,
      ),
    );
  }

  void setSelectedContent(ContentModel content) {
    emit(
      state.copyWith(
        selectedVideo: content,
      ),
    );
  }
}
