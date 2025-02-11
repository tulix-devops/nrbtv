import 'package:commons/commons.dart';
import 'package:nrbtv/src/data/data.dart';

final class OnboardingRemoteDataSource with ApiCallHandler {
  const OnboardingRemoteDataSource(this._client);

  final CustomHTTPClient _client;

  Future<ResponseModel<OnboardingListModel>> getList() async {
    return handleApiCall<OnboardingListModel>(
      url: APIList.onBoarding,
      httpMethod: HttpMethod.get,
      dataMapper: OnboardingListModel.fromJson,
      client: _client,
    );
  }
}
