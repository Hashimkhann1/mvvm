

import 'package:mvvmprac/data/network/network_api_services.dart';
import 'package:mvvmprac/model/models/login/login_responce_model/user_model.dart';
import 'package:mvvmprac/model/user_list_model/user_list_model.dart';
import 'package:mvvmprac/res/app_urls/app_urls.dart';

class UserListRepository {

  final _apiSServices = NetworkApiServics();

  Future<UserListModel> userListApi() async {
    dynamic responce = await _apiSServices.getApi(AppUrls.userListApi);
    return UserListModel.fromJson(responce);
  }

}