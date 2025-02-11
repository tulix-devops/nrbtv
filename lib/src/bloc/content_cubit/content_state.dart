part of 'content_cubit.dart';

@freezed
class ContentState with _$ContentState {
  const ContentState._();
  const factory ContentState({
    @Default(Status.initial) Status status,
    @Default([]) List<ContentModel>? mainPageContent,
    @Default([]) List<ContentModel>? relatedContent,
    @Default(null) Map<String, List<ContentModel>>? homePageContent,
    @Default(null) ContentModel? selectedVideo,
    @Default(null) Map<String, List<ContentModel>>? categoryData,
    @Default(null) ContentTypeListModel? category,
    @Default(Status.initial) Status contentStatus,
    @Default(Status.initial) Status categoryStatus,
    @Default(Status.initial) Status homePageStatus,
    @Default(1) int page,
    @Default(false) bool hasMorePages,
    @Default(ContentType.movie) ContentType selectedContent,
  }) = _ContentState;
}
