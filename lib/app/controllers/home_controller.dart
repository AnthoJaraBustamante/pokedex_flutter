import 'package:get/get.dart';
import 'package:pokedex_flutter/app/data/models/pokemon_model.dart';
import 'package:pokedex_flutter/app/data/services/pokemon_service.dart';
import 'package:pokedex_flutter/app/ui/utils/customed_toast.dart';

class HomeController extends GetxController {
  final PokemonService _pokemonService = Get.find<PokemonService>();
  Pokemon? pokemon;
  bool found = false;
  String idName = '1';
  int id = 1;
  double value = 0;

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

  void nextPage() {
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

  @override
  void onInit() {
    super.onInit();
    getPokemon(idName);
  }

  void previousPage() {
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

  void stats() {}
}
