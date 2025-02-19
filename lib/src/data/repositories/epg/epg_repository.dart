import 'package:commons/commons.dart';
import 'package:nrbtv/src/data/data_sources/live_datasource/live_data_source.dart';
import 'package:nrbtv/src/data/models/content/live_model.dart';
import 'package:nrbtv/src/data/models/content/schedule_model.dart';

abstract class EpgRepository {
  Future<ResponseModel<ScheduleModel>> getEpg(week);
  Future<ResponseModel<LiveModel>> getLive();
}

final class EpgRepositoryImpl implements EpgRepository {
  EpgRepositoryImpl({required LiveDataSource dataSource})
      : _liveDataSource = dataSource;

  final LiveDataSource _liveDataSource;

  @override
  Future<ResponseModel<ScheduleModel>> getEpg(week) {
    return _liveDataSource.getEpgByWeek(week);
  }

  @override
  Future<ResponseModel<LiveModel>> getLive() {
    // TODO: implement getLive
    return _liveDataSource.getLive();
  }
}
