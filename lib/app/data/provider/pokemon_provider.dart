import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:pokedex_flutter/app/data/models/pokemon_model.dart';

class PokemonApi {
  final Dio _dio = Get.find<Dio>();

  Future<Map<String, dynamic>> getPokemon(String id) async {
    Pokemon? pokemon;
    late Response<dynamic> response;
    try {
      response = await _dio.get('pokemon/$id');
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return <String, dynamic>{
          'pokemon': null,
          'success': false,
          'message': 'No existe',
        };
      }
      const String checkInternetMessage =
          'Revise su conexión a Internet y vuelva a intentarlo.';
      return <String, dynamic>{
        'pokemon': null,
        'success': false,
        'message': e.type.name == 'other'
            ? checkInternetMessage
            : e.type.name == 'connectTimeout'
                ? 'Se acabo el tiempo de espera. $checkInternetMessage'
                : e.message,
      };
    }
    return <String, dynamic>{
      'pokemon': pokemon =
          Pokemon.fromJson(response.data as Map<String, dynamic>),
      'success': true,
      'message': pokemon.name,
    };
  }
}
