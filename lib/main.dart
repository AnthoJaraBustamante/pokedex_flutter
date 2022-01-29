import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/app/bindings/splash_binding.dart';
import 'package:pokedex_flutter/app/routes/app_pages.dart';
import 'package:pokedex_flutter/app/routes/routes.dart';
import 'package:pokedex_flutter/app/ui/dependency_injection.dart';
import 'package:pokedex_flutter/app/ui/pages/splash_page/splash_page.dart';
import 'package:resize/resize.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  DependencyInjection.init();
  runApp(
    Resize(
      builder: () {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.fade,
          getPages: AppPages.pages,
          home: const SplashPage(),
          initialBinding: SplashBinding(),
          initialRoute: Routes.splash,
        );
      },
    ),
  );
}
