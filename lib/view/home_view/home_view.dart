

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmprac/res/routes/routes_name.dart';
import 'package:mvvmprac/utils/utils.dart';
import 'package:mvvmprac/view_model/user_preference_view_model/user_preference_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final UserPreference userPreference = UserPreference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to home",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            IconButton(onPressed: () {
              userPreference.removeUser().then((value) {
                Get.toNamed(RoutesName.loginView);
                Utils.snackBar("Sin Out", "User Sin out successfuly");
              }).onError((error, stackTrace) {
                Utils.snackBar("Error", error.toString());
              });
            }, icon: Icon(Icons.logout),color: Colors.teal,)
          ],
        ),
      ),
    );
  }
}
