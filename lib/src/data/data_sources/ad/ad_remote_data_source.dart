import 'package:commons/commons.dart';
import 'package:nrbtv/src/data/models/ad_model/ad_model.dart';
import 'package:nrbtv/src/data/params/params.dart';

final class AdRemoteDataSource with ApiCallHandler {
  const AdRemoteDataSource(this._client);

  final CustomHTTPClient _client;

  Future<ResponseModel<AdModel>> checkCustomerAdStatus(String token) async {
    return handleApiCall<AdModel>(
      url: '${APIList.customerAdStatus}?accessToken=$token',
      httpMethod: HttpMethod.get,
      dataMapper: AdModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<bool>> logAdEvent(AdLogEventParams params) {
    return handleApiCall(
      url: '${APIList.adLogEvent}?accessToken=${params.token}',
      httpMethod: HttpMethod.post,
      body: params.toJson(),
      client: _client,
    );
  }
}
