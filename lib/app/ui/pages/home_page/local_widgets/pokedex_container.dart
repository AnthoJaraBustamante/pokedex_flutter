import 'package:flutter/material.dart';
import 'package:pokedex_flutter/app/ui/pages/home_page/local_widgets/pokedex_left_side.dart';
import 'package:pokedex_flutter/app/ui/theme/color_theme.dart';
// ignore: implementation_imports
import 'package:resize/src/resizeExtension.dart';

class PokedexContainer extends StatelessWidget {
  const PokedexContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        height: 32.rem,
        width: 23.rem,
        decoration: BoxDecoration(
          color: MainColor.red,
          border: Border.all(
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(255, 0, 0, 0.4),
              blurRadius: 21,
              spreadRadius: -2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: const PokedexLeft(),
      ),
    );
  }
}
