import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:projeto_filmes/application/modules/module.dart';
import 'package:projeto_filmes/modules/splash/splash_page.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => SplashPage(),
    )
  ];
}
