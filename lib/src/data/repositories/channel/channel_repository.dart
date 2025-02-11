import 'package:commons/commons.dart';
import 'package:nrbtv/src/data/data.dart';

abstract class ChannelRepository {
  Future<ResponseModel<ChannelListModel>> getChannels();
}

final class ChannelRepositoryImpl implements ChannelRepository {
  ChannelRepositoryImpl(
      {required ChannelRemoteDataSource channelRemoteDataSource})
      : _channelRemoteDataSource = channelRemoteDataSource;

  final ChannelRemoteDataSource _channelRemoteDataSource;

  @override
  Future<ResponseModel<ChannelListModel>> getChannels() {
    return _channelRemoteDataSource.getChannels();
  }
}
