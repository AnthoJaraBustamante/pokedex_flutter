// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:pokedex_flutter/app/data/provider/pokemon_provider.dart';
import 'package:pokedex_flutter/app/data/services/pokemon_service.dart';

class DependencyInjection {
  static void init() {
    const String baseUrl = 'https://pokeapi.co/api/v2/';
    Get.put(Dio(BaseOptions(baseUrl: baseUrl)));

    ///PROVIDERS
    Get.put(PokemonApi());

    ///SERVICES
    Get.put(PokemonService());
  }
}
