


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvvmprac/model/models/login/login_responce_model/user_model.dart';
import 'package:mvvmprac/repository/loin_repository/login_repository.dart';
import 'package:mvvmprac/res/routes/routes_name.dart';
import 'package:mvvmprac/utils/utils.dart';
import 'package:mvvmprac/view_model/user_preference_view_model/user_preference_view_model.dart';

class LoginViewModel extends GetxController {

  final UserPreference userPreference = UserPreference();
  final _api = LoginRepository();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  final RxBool loadin = false.obs;
  
  void loinApi() {
    loadin.value = true;
    Map data = {
      'email': emailController.value.text.toString(),
      'password': passwordController.value.text.toString(),
    };
    _api.loinApi(data).then((value) {
      Utils.snackBar("Loging", "Loin Successfully");
      userPreference.saveUser(UserModel.fromJson(value)).then((value){
        Get.toNamed(RoutesName.homeView);
      }).onError((error, stackTrace){
        
      });
      loadin.value = false;
    }).onError((error, stackTrace) {
      Utils.snackBar("Error", error.toString());
      loadin.value = false;
    });
  }

}