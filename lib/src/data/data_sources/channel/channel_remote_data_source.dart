import 'package:commons/commons.dart';
import 'package:nrbtv/src/data/data.dart';

final class ChannelRemoteDataSource with ApiCallHandler {
  const ChannelRemoteDataSource(this._client);

  final CustomHTTPClient _client;

  Future<ResponseModel<ChannelListModel>> getChannels() async {
    return handleApiCall<ChannelListModel>(
      url: APIList.channelList,
      httpMethod: HttpMethod.get,
      dataMapper: ChannelListModel.fromJson,
      client: _client,
    );
  }
}
