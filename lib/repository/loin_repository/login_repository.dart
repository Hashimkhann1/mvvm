


import 'package:mvvmprac/data/network/network_api_services.dart';
import 'package:mvvmprac/res/app_urls/app_urls.dart';

class LoginRepository {

  final _apiServices = NetworkApiServics();

  Future<dynamic> loinApi(var data, ) async {
    dynamic responce = _apiServices.postApi(data, AppUrls.loginApi);
    return responce;
  }

}