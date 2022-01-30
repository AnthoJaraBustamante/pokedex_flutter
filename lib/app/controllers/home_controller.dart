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

  bool found = false;
  String idName = '1';
  int id = 1;
  double value = 0;

  String? get frontDefault {
    return pokemon!.sprites?.frontDefault;
  }

  String? get backDefault {
    return pokemon!.sprites?.backDefault;
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
    update(<Object>['pokemon']);
    final Map<String, dynamic> response =
        await _pokemonService.getService(id: id);
    found = response['success'] as bool;
    if (found) {
      pokemon = response['pokemon'] as Pokemon;
      update(<Object>['pokemon']);
      return;
    }
    customedToast(response['message'] as String);
  }

  void nextPokemon() {
    id = int.parse(idName);
    if (id == 889) {
      id = 1;
      idName = id.toString();
      getPokemon(idName);
      return;
    }
    id++;
    idName = id.toString();
    getPokemon(idName);
  }

  void nextTapDown(TapDownDetails details) {
    timer = Timer.periodic(const Duration(milliseconds: 150), (Timer t) {
      nextPokemon();
    });
  }

  @override
  void onInit() {
    super.onInit();
    getPokemon(idName);
  }

  void onTapCancel() {
    timer.cancel();
  }

  void onTapUp(TapUpDetails details) {
    onTapCancel();
  }

  void previousPokemon() {
    id = int.parse(idName);
    if (id == 1) {
      id = 889;
      idName = id.toString();
      getPokemon(idName);
      return;
    }
    id--;
    idName = id.toString();
    getPokemon(idName);
  }

  void previousTapDown(TapDownDetails details) {
    timer = Timer.periodic(const Duration(milliseconds: 150), (Timer t) {
      previousPokemon();
    });
  }

  void stats() {}
}
