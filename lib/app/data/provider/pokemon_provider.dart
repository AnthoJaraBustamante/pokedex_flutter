import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:pokedex_flutter/app/data/models/pokemon_model.dart';
import 'package:pokedex_flutter/app/ui/utils/customed_toast.dart';

class PokemonApi {
  final Dio _dio = Get.find<Dio>();

  Future<Pokemon?> getPokemon(int id) async {
    Pokemon? pokemon;
    late Response<dynamic> response;
    try {
      response = await _dio.get('pokemon/$id');
      if (response.statusCode == 200) {
        return pokemon =
            Pokemon.fromJson(response.data as Map<String, dynamic>);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        customedToast(e.response!.statusCode.toString());
      }
      throw e;
    }
    return pokemon;
  }
}
