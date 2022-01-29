import 'dart:developer';
import 'dart:math';

import 'package:get/get.dart';
import 'package:pokedex_flutter/app/data/models/pokemon_model.dart';
import 'package:pokedex_flutter/app/data/services/pokemon_service.dart';

class HomeController extends GetxController {
  final PokemonService _pokemonService = Get.find<PokemonService>();
  Pokemon? pokemon;
  String? frontImage;
  String name = '';

  @override
  void onInit() {
    super.onInit();
    getRandomPokemon();
  }

  Future<void> getPokemon({int? id}) async {
    print(id);
    pokemon = await _pokemonService.getService(id: id ?? 1);
    frontImage = null;

    frontImage = pokemon?.sprites?.frontDefault;

    inspect(frontImage);
    update(<Object>['pokemon']);
  }

  Future<void> getRandomPokemon() async {
    final Random random = Random();
    pokemon = null;
    update(<Object>['pokemon']);
    await getPokemon(id: random.nextInt(807));
  }
}
