import 'package:flutter/material.dart';
import 'package:pokedex_flutter/app/ui/pages/home_page/local_widgets/pokedex_container.dart';
import 'package:pokedex_flutter/app/ui/theme/color_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MainColor.darkRed,
        child: Stack(
          children: const <Widget>[
            PokedexContainer(),
          ],
        ),
      ),
    );
  }
}
