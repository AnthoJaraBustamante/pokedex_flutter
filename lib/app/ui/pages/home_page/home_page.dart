import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/app/controllers/home_controller.dart';
import 'package:pokedex_flutter/app/ui/pages/home_page/local_widgets/pokedex_container.dart';
import 'package:pokedex_flutter/app/ui/theme/color_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MainColor.darkRed,
        child: GetBuilder<HomeController>(
          init: HomeController(),
          initState: (_) {},
          builder: (_) {
            return Stack(
              children: <Widget>[
                const PokedexContainer(),
                Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}
