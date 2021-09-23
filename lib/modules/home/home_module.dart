import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:projeto_filmes/application/modules/module.dart';
import 'package:projeto_filmes/modules/home/home_bindings.dart';
import 'package:projeto_filmes/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(name: '/home', page: () => HomePage(), binding: HomeBindings()),
  ];
}
