import 'package:projeto_filmes/models/genre_model.dart';
import 'package:projeto_filmes/repositories/genres/genres_repository.dart';

import './genres_service.dart';

class GenreServiceImpl implements GenreService {
  final GenresRepository _genresRepository;

  GenreServiceImpl({required GenresRepository genresRepository})
      : _genresRepository = genresRepository;

  @override
  Future<List<GenreModel>> getGenres() => _genresRepository.getGenres();
}
