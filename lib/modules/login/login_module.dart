import 'package:get/get.dart';
import 'package:projeto_filmes/application/modules/module.dart';
import 'package:projeto_filmes/modules/login/login_binding.dart';
import 'package:projeto_filmes/modules/login/login_page.dart';

class LoginModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/login',
      page: () => LoginPage(),
      binding: LoginBinding(),
    )
  ];
}
