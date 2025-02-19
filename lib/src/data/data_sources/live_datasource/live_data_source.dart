import 'package:commons/commons.dart';
import 'package:nrbtv/src/data/models/content/live_model.dart';
import 'package:nrbtv/src/data/models/content/schedule_model.dart';

final class LiveDataSource with ApiCallHandler {
  const LiveDataSource(this._client);

  final CustomHTTPClient _client;

  Future<ResponseModel<ScheduleModel>> getEpgByWeek(int week) async {
    return handleApiCall<ScheduleModel>(
      url: '${APIList.getEpg}?week=$week',
      httpMethod: HttpMethod.get,
      dataMapper: ScheduleModel.fromJson,
      client: _client,
    );
  }

  Future<ResponseModel<LiveModel>> getLive() async {
    return handleApiCall<LiveModel>(
      url: APIList.getLive,
      httpMethod: HttpMethod.get,
      dataMapper: LiveModel.fromJson,
      client: _client,
    );
  }
}
