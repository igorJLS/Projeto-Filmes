import 'package:projeto_filmes/models/genre_model.dart';
import 'package:projeto_filmes/repositories/genres/genres_repository.dart';

abstract class GenreService {
  Future<List<GenreModel>> getGenres();
}
