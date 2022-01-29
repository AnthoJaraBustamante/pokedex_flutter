import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pokedex_flutter/app/bindings/home_binding.dart';
import 'package:pokedex_flutter/app/routes/routes.dart';
import 'package:pokedex_flutter/app/ui/pages/home_page/home_page.dart';

class AppPages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    // GetPage<dynamic>(
    //   name: Routes.splash,
    //   page: () => const SplashPage(),
    //   binding: SplashBinding(),
    // ),
    GetPage<dynamic>(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
