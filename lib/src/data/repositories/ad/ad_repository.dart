import 'package:commons/commons.dart';
import 'package:nrbtv/src/data/data_sources/ad/ad_remote_data_source.dart';
import 'package:nrbtv/src/data/models/ad_model/ad_model.dart';
import 'package:nrbtv/src/data/params/ad_log_event_params.dart';

abstract class AdRepository {
  Future<ResponseModel<AdModel>> checkCustomerAdStatus(String token);
  Future<ResponseModel<bool>> logAdEvent(AdLogEventParams params);
}

final class AdRepositoryImpl implements AdRepository {
  AdRepositoryImpl({required AdRemoteDataSource adRemoteDataSource})
      : _adRemoteDataSource = adRemoteDataSource;

  final AdRemoteDataSource _adRemoteDataSource;

  @override
  Future<ResponseModel<AdModel>> checkCustomerAdStatus(String token) {
    return _adRemoteDataSource.checkCustomerAdStatus(token);
  }

  @override
  Future<ResponseModel<bool>> logAdEvent(AdLogEventParams params) {
    return _adRemoteDataSource.logAdEvent(params);
  }
}
