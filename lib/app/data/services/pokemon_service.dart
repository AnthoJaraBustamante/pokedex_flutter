import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:pokedex_flutter/app/data/provider/pokemon_provider.dart';

class PokemonService {
  final PokemonApi pokemonApi = Get.find<PokemonApi>();
  Future<Map<String, dynamic>> getService({required String id}) async {
    return pokemonApi.getPokemon(id);
  }
}
