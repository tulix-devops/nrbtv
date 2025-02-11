import 'package:commons/commons.dart';
import 'package:nrbtv/src/data/data.dart';
import 'package:nrbtv/src/data/models/profile/customer_info_model.dart';

class ProfileRemoteDataSource with ApiCallHandler {
  ProfileRemoteDataSource(this._client);

  // HTTP CLIENT
  final CustomHTTPClient _client;

  Future<ResponseModel<ProfileModel>> fillProfileInfo(
      FillProfileInfoParams params) async {
    return handleApiCall<ProfileModel>(
      url: APIList.fillProfileInfo,
      httpMethod: HttpMethod.postFormData,
      headers: {
        'Content-Type': 'multipart/form-data',
      },
      body: params.toJson(),
      dataMapper: ProfileModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<CustomerInfoModel>> getCustomerInfo() async {
    return handleApiCall<CustomerInfoModel>(
      url: APIList.getCustomerInfo,
      httpMethod: HttpMethod.get,
      dataMapper: CustomerInfoModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<ProfileModel>> getProfileInfo() async {
    return handleApiCall<ProfileModel>(
      url: APIList.getProfileInfo,
      httpMethod: HttpMethod.get,
      dataMapper: ProfileModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<CancelSubscriptionModel>> cancelSubscription(
      String token) async {
    return handleApiCall(
      url: "${APIList.cancelSubscription}?accessToken=$token",
      httpMethod: HttpMethod.get,
      dataMapper: CancelSubscriptionModel.fromJson,
      client: _client,
    );
  }
}
