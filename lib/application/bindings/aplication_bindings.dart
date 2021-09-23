import 'package:get/get.dart';
import 'package:projeto_filmes/application/auth/auth_service.dart';
import 'package:projeto_filmes/application/rest_client/rest_client.dart';
import 'package:projeto_filmes/repositories/login/login_repository.dart';
import 'package:projeto_filmes/repositories/login/login_repository_impl.dart';
import 'package:projeto_filmes/repositories/movies/movies_repository.dart';
import 'package:projeto_filmes/repositories/movies/movies_repository_impl.dart';
import 'package:projeto_filmes/services/login/login_services.dart';
import 'package:projeto_filmes/services/login/login_services_impl.dart';
import 'package:projeto_filmes/services/movies/movies_service.dart';
import 'package:projeto_filmes/services/movies/movies_service_impl.dart';

class AplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(), fenix: true);
    Get.lazyPut<LoginService>(
        () => LoginServicesImpl(loginRepository: Get.find()),
        fenix: true);
    Get.put(AuthService()).init();

    Get.lazyPut<MoviesRepository>(
        () => MoviesRepositoryImpl(restClient: Get.find()));
    Get.lazyPut<MoviesService>(
        () => MoviesServiceImpl(moviesRepository: Get.find()));
  }
}
