import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/app/data/models/pokemon_model.dart';
import 'package:pokedex_flutter/app/data/services/pokemon_service.dart';
import 'package:pokedex_flutter/app/ui/utils/customed_toast.dart';

class HomeController extends GetxController {
  final PokemonService _pokemonService = Get.find<PokemonService>();
  late Timer timer;
  Pokemon? pokemon;
  final List<String?> sprites = <String?>[];

  bool found = false;
  String idName = '1';
  int currentId = 1;
  double value = 0;
  int spriteIndex = 0;

  String prevIcon = 'assets/tap.png';
  String prevDownIcon = 'assets/tapdown.png';
  String nextIcon = 'assets/nextTap.png';
  String nextDownIcon = 'assets/nexttapdown.png';
  String flipIcon = 'assets/flip.png';
  String flip2Icon = 'assets/flip2.png';

  late TextEditingController searchController;

  bool prevDownActive = false;
  bool nextDownActive = false;
  bool flipped = false;

  void getSprites() {
    sprites.clear();
    if (pokemon!.sprites?.frontDefault != null) {
      sprites.add(pokemon!.sprites?.frontDefault);
    }
    if (pokemon!.sprites?.backDefault != null) {
      sprites.add(pokemon!.sprites?.backDefault);
    }
    // if (pokemon!.sprites?.frontFemale != null) {
    //   sprites.add(pokemon!.sprites?.frontFemale);
    // }
    // if (pokemon!.sprites?.backFemale != null) {
    //   sprites.add(pokemon!.sprites?.backFemale);
    // }
  }

  String get attack {
    return pokemon!.stats
            ?.firstWhere((Stat stat) => stat.stat?.name == 'attack')
            .baseStat
            ?.toString() ??
        '';
  }

  String get defense {
    return pokemon!.stats
            ?.firstWhere((Stat stat) => stat.stat?.name == 'defense')
            .baseStat
            ?.toString() ??
        '';
  }

  String get hp {
    return pokemon!.stats
            ?.firstWhere((Stat stat) => stat.stat?.name == 'hp')
            .baseStat
            ?.toString() ??
        '';
  }

  String get spAttack {
    return pokemon!.stats
            ?.firstWhere((Stat stat) => stat.stat?.name == 'special-attack')
            .baseStat
            ?.toString() ??
        '';
  }

  String get spDefense {
    return pokemon!.stats
            ?.firstWhere((Stat stat) => stat.stat?.name == 'special-defense')
            .baseStat
            ?.toString() ??
        '';
  }

  String get speed {
    return pokemon!.stats
            ?.firstWhere((Stat stat) => stat.stat?.name == 'speed')
            .baseStat
            ?.toString() ??
        '';
  }

  Future<void> getPokemon(String id) async {
    pokemon = null;
    found = true;
    spriteIndex = 0;
    sprites.clear();
    update(<Object>['pokemon']);
    final Map<String, dynamic> response =
        await _pokemonService.getService(id: id);
    found = response['success'] as bool;
    if (found) {
      pokemon = response['pokemon'] as Pokemon;
      currentId = pokemon!.id!;
      idName = currentId.toString();
      getSprites();
      update(<Object>['pokemon']);
      return;
    }
    update(<Object>['pokemon']);
    customedToast(response['message'] as String);
  }

  void changeSprite() {
    flipped = !flipped;
    if (spriteIndex < sprites.length - 1) {
      spriteIndex++;
    } else {
      spriteIndex = 0;
    }
    update(<Object>['pokemon', 'bottom_lights']);
  }

  void nextPokemon() {
    currentId = int.parse(idName);
    if (currentId == 898) {
      currentId = 1;
      idName = currentId.toString();
      getPokemon(idName);
      return;
    }
    currentId++;
    idName = currentId.toString();
    getPokemon(idName);
  }

  void nextTapDown(TapDownDetails details) {
    nextDownActive = true;
    update(<Object>['bottom_lights']);
    timer = Timer.periodic(const Duration(milliseconds: 150), (Timer t) {
      nextPokemon();
    });
  }

  void flipTapDown(TapDownDetails details) {
    timer = Timer.periodic(const Duration(milliseconds: 150), (Timer t) {
      flipped = !flipped;
      changeSprite();
    });
  }

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    getPokemon(idName);
  }

  void onTapCancel() {
    nextDownActive = false;
    prevDownActive = false;
    timer.cancel();
    update(<Object>['bottom_lights']);
  }

  void onTapUp(TapUpDetails details) {
    onTapCancel();
  }

  void previousPokemon() {
    currentId = int.parse(idName);
    if (currentId == 1) {
      currentId = 898;
      idName = currentId.toString();
      getPokemon(idName);
      return;
    }
    currentId--;
    idName = currentId.toString();
    getPokemon(idName);
  }

  void previousTapDown(TapDownDetails details) {
    prevDownActive = true;
    update(<Object>['bottom_lights']);
    timer = Timer.periodic(const Duration(milliseconds: 150), (Timer t) {
      previousPokemon();
    });
  }

  void stats() {}

  void searchPokemon() {
    getPokemon(searchController.text.toLowerCase());
  }
}
