import 'package:get/get.dart';
import 'package:mvvmprac/res/routes/routes_name.dart';

import '../../view/splash_view.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashView,
            page: () => const SplashView(),
            transitionDuration: const Duration(microseconds: 260),
            transition: Transition.leftToRight),
      ];
}
