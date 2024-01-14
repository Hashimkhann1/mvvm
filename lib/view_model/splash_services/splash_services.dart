



import 'dart:async';
import 'package:get/get.dart';
import 'package:mvvmprac/res/routes/routes_name.dart';
import 'package:mvvmprac/view_model/user_preference_view_model/user_preference_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashServices {

  UserPreference userPreference = UserPreference();

  void isLogin() {

    userPreference.getUser().then((value){

      if(value.token!.isEmpty || value.token.toString() == null){
        Timer(Duration(seconds: 3) , () {
          Get.toNamed(RoutesName.loginView);
        });
      }else{
        Timer(Duration(seconds: 3) , () {
          Get.toNamed(RoutesName.homeView);
        });
      }

    }).onError((error, stackTrace){

    });

    Timer(Duration(seconds: 3) , () {
      Get.toNamed(RoutesName.loginView);
    });
  }
}