import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokedex_flutter/app/controllers/splash_controller.dart';
import 'package:pokedex_flutter/app/ui/theme/color_theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          backgroundColor: MainColor.darkRed,
          body: SafeArea(
            child: Stack(
              children: const <Widget>[
                Align(
                  child: CircularProgressIndicator(),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Pokedex',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Align()
              ],
            ),
          ),
        );
      },
    );
  }
}
