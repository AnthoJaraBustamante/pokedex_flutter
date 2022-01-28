import 'package:flutter/material.dart';
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
        height: 31.rem,
        width: 23.rem,
        decoration: BoxDecoration(
          color: MainColor.red,
          border: Border.all(
            width: 5,
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

class PokedexLeft extends StatelessWidget {
  const PokedexLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EdgeInsets margin = EdgeInsets.only(right: 0.8.rem);
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 10, right: 0.7.rem),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: <Widget>[
            const TopLeftLights(),
            Container(
              height: 31.rem / 2,
              width: 23.rem,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              padding: EdgeInsets.all(0.8.rem),
              decoration: BoxDecoration(
                color: MainColor.screen,
                border: Border.all(
                  width: 5,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Light(
                  width: 40,
                  height: 40,
                  color: MainColor.blue,
                  margin: margin,
                ),
                Light(
                  width: 80,
                  color: MainColor.green,
                  margin: margin,
                  isLarge: true,
                ),
                Light(
                  width: 80,
                  color: MainColor.yellow,
                  margin: margin,
                  isLarge: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TopLeftLights extends StatelessWidget {
  const TopLeftLights({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EdgeInsets margin = EdgeInsets.only(right: 0.7.rem);
    return Row(
      children: <Widget>[
        Light(
          width: 50,
          height: 50,
          color: MainColor.sky,
          margin: margin,
        ),
        Light(
          color: MainColor.red,
          margin: margin,
        ),
        Light(
          color: MainColor.yellow,
          margin: margin,
        ),
        Light(
          color: MainColor.green,
          margin: margin,
        ),
      ],
    );
  }
}

class Light extends StatelessWidget {
  const Light({
    Key? key,
    this.width,
    this.height,
    required this.color,
    this.margin,
    this.isLarge = false,
  }) : super(key: key);
  final double? width;
  final double? height;
  final Color color;
  final EdgeInsetsGeometry? margin;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width ?? 20,
      height: height ?? 20,
      decoration: BoxDecoration(
        color: color,
        shape: isLarge ? BoxShape.rectangle : BoxShape.circle,
        border: Border.all(
          width: 3,
        ),
        borderRadius: isLarge ? BorderRadius.circular(20) : null,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(255, 255, 255, 0.5),
            offset: Offset(-2, 2),
          ),
        ],
      ),
    );
  }
}
