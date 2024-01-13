import 'package:get/get.dart';
import 'package:mvvmprac/res/routes/routes_name.dart';
import 'package:mvvmprac/view/login_view/login_view.dart';

import '../../view/splash_view.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
            name: RoutesName.splashView,
            page: () => const SplashView(),
            transitionDuration: const Duration(microseconds: 260),
            transition: Transition.leftToRight),

    // lgon view route
    GetPage(
        name: RoutesName.loginView,
        page: () => const LoginView(),
        transitionDuration: const Duration(microseconds: 260),
        transition: Transition.leftToRight),
      ];
}
