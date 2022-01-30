import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokedex_flutter/app/controllers/home_controller.dart';
import 'package:pokedex_flutter/app/ui/pages/home_page/local_widgets/light.dart';
import 'package:pokedex_flutter/app/ui/pages/home_page/local_widgets/screen.dart';
import 'package:pokedex_flutter/app/ui/theme/color_theme.dart';
import 'package:resize/src/resizeExtension.dart';

class PokedexLeft extends StatelessWidget {
  const PokedexLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 10, right: 0.7.rem),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: <Widget>[
            const TopLeftLights(),
            Stack(
              children: <Widget>[
                Screen(),
              ],
            ),
            const BottomLeftLightsSearchField(),
          ],
        ),
      ),
    );
  }
}

class BottomLeftLightsSearchField extends StatelessWidget {
  const BottomLeftLightsSearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EdgeInsets margin = EdgeInsets.only(right: 0.8.rem);

    return Column(
      children: <Widget>[
        GetBuilder<HomeController>(
          id: 'bottom_lights',
          builder: (_) {
            return Row(
              children: <Widget>[
                Light(
                  width: 40,
                  height: 40,
                  color: MainColor.blue,
                  margin: margin,
                  icon: _.flipped ? _.flipIcon : _.flip2Icon,
                  onTap: () => _.changeSprite(),
                ),
                Light(
                  width: 80,
                  height: 30,
                  color: MainColor.green,
                  margin: margin,
                  isLarge: true,
                  icon: _.prevDownActive ? _.prevDownIcon : _.prevIcon,
                  onTap: () {
                    _.previousPokemon();
                  },
                  onTapDown: _.previousTapDown,
                  onTapUp: _.onTapUp,
                  onTapCancel: () => _.onTapCancel(),
                ),
                Light(
                  width: 80,
                  height: 30,
                  color: MainColor.yellow,
                  margin: margin,
                  isLarge: true,
                  icon: _.nextDownActive ? _.nextDownIcon : _.nextIcon,
                  onTap: () {
                    _.nextPokemon();
                  },
                  onTapDown: _.nextTapDown,
                  onTapUp: _.onTapUp,
                  onTapCancel: () => _.onTapCancel(),
                ),
              ],
            );
          },
        ),
      ],
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
