

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mvvmprac/model/models/login/login_responce_model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {


  Future<bool> saveUser(UserModel loginResponceModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', loginResponceModel.token.toString());
    return true;
  }

  Future<UserModel> getUser() async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    return UserModel(
      token: token
    );
  }

  Future<bool> removeUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    return true;
  }

}