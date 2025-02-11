import 'package:commons/commons.dart';
import 'package:nrbtv/src/data/data.dart';
import 'package:nrbtv/src/data/models/profile/customer_info_model.dart';

abstract interface class ProfileRepository {
  Future<ResponseModel<ProfileModel>> fillProfileInfo(
      FillProfileInfoParams params);
  Future<ResponseModel<ProfileModel>> getProfileInfo();
  Future<ResponseModel<CustomerInfoModel>> getCustomerInfo();
  Future<ResponseModel<CancelSubscriptionModel>> cancelSubscription(
      String token);
}

final class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(
      {required ProfileRemoteDataSource profileRemoteDataSource, required})
      : _profileRemoteDataSource = profileRemoteDataSource;

  final ProfileRemoteDataSource _profileRemoteDataSource;

  @override
  Future<ResponseModel<ProfileModel>> fillProfileInfo(
      FillProfileInfoParams params) {
    return _profileRemoteDataSource.fillProfileInfo(params);
  }

  @override
  Future<ResponseModel<CustomerInfoModel>> getCustomerInfo() {
    return _profileRemoteDataSource.getCustomerInfo();
  }

  @override
  Future<ResponseModel<ProfileModel>> getProfileInfo() {
    return _profileRemoteDataSource.getProfileInfo();
  }

  @override
  Future<ResponseModel<CancelSubscriptionModel>> cancelSubscription(
      String token) {
    return _profileRemoteDataSource.cancelSubscription(token);
  }
}
