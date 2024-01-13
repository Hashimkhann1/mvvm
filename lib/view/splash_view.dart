import 'package:flutter/material.dart';
import 'package:mvvmprac/data/app_exception.dart';
import 'package:mvvmprac/res/assets/images_assets.dart';
import 'package:mvvmprac/view_model/splash_services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  final ImagesAssets imagesAssets  = ImagesAssets();
  final SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Text("Welcome back")
      ),


      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     throw InternetException("! Your internat connection is not working");
      //   },
      // ),
    );
  }
}
