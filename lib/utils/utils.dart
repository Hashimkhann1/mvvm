

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mvvmprac/res/colors/app_colors.dart';

class Utils {

  static void fieldFocusChange(BuildContext context , FocusNode current , FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }


  // flutter toast message
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
      backgroundColor: AppColors.blackColor,
      textColor: AppColors.whiteColor,
    );
  }

  // get snack bar
  static snackBar(String title , String messgae) {
    Get.snackbar(title , messgae);
  }



}