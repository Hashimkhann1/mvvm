import 'package:flutter/material.dart';
import 'package:mvvmprac/data/app_exception.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Spash View"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          throw InternetException("! Your internat connection is not working");
        },
      ),
    );
  }
}
