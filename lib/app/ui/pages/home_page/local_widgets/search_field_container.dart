import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_flutter/app/controllers/home_controller.dart';
import 'package:pokedex_flutter/app/ui/pages/home_page/local_widgets/light.dart';
import 'package:pokedex_flutter/app/ui/theme/color_theme.dart';
import 'package:resize/src/resizeExtension.dart';

class SearchFieldContainer extends StatelessWidget {
  const SearchFieldContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EdgeInsets margin = EdgeInsets.only(right: 0.8.rem);

    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: MainColor.yellow,
              borderRadius: BorderRadius.circular(1.rem),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  offset: Offset(-2, 2),
                ),
              ],
              border: Border.all(
                color: Colors.white,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 0.5.rem),
            child: GetBuilder<HomeController>(
              builder: (_) {
                return TextField(
                  controller: _.searchController,
                  style: GoogleFonts.mochiyPopOne(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Busca tu Pokémon',
                    labelStyle: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                    ),
                    border: InputBorder.none,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(width: 0.8.rem),
        GetBuilder<HomeController>(
          builder: (_) {
            return Light(
              width: 50,
              height: 50,
              color: MainColor.red.withOpacity(0.6),
              margin: margin,
              onTap: () => _.searchPokemon(),
            );
          },
        ),
      ],
    );
  }
}
