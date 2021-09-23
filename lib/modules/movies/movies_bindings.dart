import 'package:get/get.dart';
import 'package:projeto_filmes/modules/movies/movies_controller.dart';
import 'package:projeto_filmes/repositories/genres/genres_repository.dart';
import 'package:projeto_filmes/repositories/genres/genres_repository_impl.dart';
import 'package:projeto_filmes/services/genres/genres_service.dart';
import 'package:projeto_filmes/services/genres/genres_service_impl.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenresRepository>(
      () => GenresRepositoryImpl(restClient: Get.find()),
    );

    Get.lazyPut<GenreService>(
        () => GenreServiceImpl(genresRepository: Get.find()));

    Get.lazyPut(() =>
        MoviesController(genreService: Get.find(), moviesService: Get.find()));
  }
}
