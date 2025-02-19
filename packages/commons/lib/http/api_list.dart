// const String _url = 'https://208.79.153.183/api';
const String _url = 'https://nrbtv.tulix.net/api';
// const String _url = 'http://192.168.1.154:8000/api';

class APIList {
  APIList._();

  static const String onBoarding = '$_url/onboarding';

  static const String collectionList = '$_url/collection/list';
  static const String contentTypeList = '$_url/content-type/list';

  static const String search = '$_url/content/search';

  // HOME PAGE
  static const String homePageList = '$_url/videos/home-page';
  static const String vodList = '$_url/videos';
  static const String vodSearch = '$_url/videos/search';

  static const String getEpg = '$_url/content/epg';
  static const String getLive = '$_url/content';

  // VOD
  static const String countryList = '$_url/countries';
  static const String categoryList = '$_url/categories';

  static const String relatedVodList = '$_url/videos/related';

  //My list
  // static const String savedVideos = '$_url/videos/saved';

  static const String savedVideos = '$_url/user-videos';

  static const String saveVideo = '$_url/user-videos/save';

  // Channel
  static const String channelList = '$_url/channels';

  static const String login = '$_url/login';
  static const String signUp = '$_url/sign-up';
  static const String logout = '$_url/logout';
  static const String refreshToken = '$_url/refresh-token';
  static const String storeFcmToken = '$_url/fcm-token';
  static const String loginWithBiometrics = '$_url/login-with-biometrics';

  // USER
  static const String fillProfileInfo = '$_url/profile/fill-info';
  static const String getCustomerInfo = '$_url/customer';
  static const String getProfileInfo = '$_url/profile/get-user';
  static const String cancelSubscription = '$_url/subscriptions/cancel';

  // Advertisment
  static const String customerAdStatus = '$_url/ad/check-customer-ad-status';
  static const String adLogEvent = '$_url/ad/logevent';

  static String getByTypeId(int id) {
    return '$_url/content/$id/list';
  }

  static String getRelatedContentById(int typeId, int contentId) {
    return '$_url/content/related/$typeId/$contentId';
  }

  static String storage(String image) {
    // return 'https://208.79.153.183/storage/$image';
    // return 'https://183.bozztv.com/storage/$image';
    return 'https://pockochannel.13.bozztv.com/storage/$image';
  }

  static String videoStorage(String image) {
    // return 'https://208.79.153.183/storage/movies/$image';
    return 'https://pockochannel.13.bozztv.com/storage/movies/$image';
  }

  static String contentList({required int typeId}) {
    return '$_url/content/${typeId}/paginated-list';
  }

  static String contentListByCategory(
      {required int typeId, required int categoryId}) {
    return '$_url/content/{$typeId}/{$categoryId}/list';
  }

  static String featureList({required int typeId}) {
    return '$_url/content/$typeId/featured-list';
  }

  static String getCategoriesById({required int typeId}) {
    return '$_url/category/$typeId/list';
  }

  static String getPaginatedCollection(int collectionId) {
    return 'https://wchupload.tulix.net/api/collection/$collectionId/content/list';
  }
}
