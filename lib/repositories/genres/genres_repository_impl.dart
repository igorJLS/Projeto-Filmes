import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:projeto_filmes/application/rest_client/rest_client.dart';
import 'package:projeto_filmes/models/genre_model.dart';

import './genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  GenresRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.get<List<GenreModel>>('/genre/movie/list',
        query: {
          'api-key': RemoteConfig.instance.getString('api-token'),
          'language': 'pt-br'
        }, decoder: (data) {
      final resultData = data['genres'];
      if (resultData != null) {
        return resultData
            .map<GenreModel>((g) => GenreModel.fromMap(g))
            .toList();
      }
      return <GenreModel>[];
    });

    if (result.hasError) {
      print(result.statusText);
      throw Exception('Erro ao buscar Genres');
    }

    return result.body ?? <GenreModel>[];
  }
}
