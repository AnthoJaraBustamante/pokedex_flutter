import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_flutter/app/controllers/home_controller.dart';
import 'package:pokedex_flutter/app/ui/theme/color_theme.dart';
import 'package:resize/src/resizeExtension.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31.rem / 2,
      width: 23.rem,
      margin: const EdgeInsets.only(top: 20, bottom: 20),
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
      child: GetBuilder<HomeController>(
        id: 'pokemon',
        builder: (_) {
          if (_.pokemon == null) {
            return Container(
              alignment: Alignment.center,
              child: _.found
                  ? Image.asset(
                      'assets/loading.gif',
                      width: 100,
                      height: 100,
                    )
                  : Image.asset(
                      'assets/error.gif',
                      height: 31.rem / 2,
                      width: 23.rem,
                      fit: BoxFit.cover,
                    ),
            );
          } else {
            return Column(
              children: <Widget>[
                Text(
                  GetUtils.capitalizeFirst(
                    _.pokemon!.name ?? '',
                  )!,
                  style: GoogleFonts.mochiyPopOne(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 1.rem,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 1.rem,
                    ),
                    BounceInUp(
                      child: CachedNetworkImage(
                        imageUrl: _.sprites[_.spriteIndex]!,
                        width: 100,
                        height: 100,
                        repeat: ImageRepeat.repeat,
                        progressIndicatorBuilder: (
                          BuildContext context,
                          String url,
                          DownloadProgress downloadProgress,
                        ) {
                          return Image.asset(
                            'assets/loading.gif',
                            width: 100,
                            height: 100,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 1.rem,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        StatsInfo(name: 'HP', base: _.hp),
                        StatsInfo(name: 'Attack', base: _.attack),
                        StatsInfo(name: 'Defense', base: _.defense),
                        StatsInfo(name: 'Sp. Attack', base: _.spAttack),
                        StatsInfo(name: 'Sp. Defense', base: _.spDefense),
                        StatsInfo(name: 'Speed', base: _.speed),
                      ],
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class StatsInfo extends StatelessWidget {
  const StatsInfo({
    Key? key,
    required this.name,
    required this.base,
  }) : super(key: key);
  final String name;
  final String base;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '$name: ',
        style: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        children: <TextSpan>[
          TextSpan(
            text: base,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
