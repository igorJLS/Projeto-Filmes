import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:projeto_filmes/application/bindings/aplication_bindings.dart';
import 'package:projeto_filmes/application/ui/filmes_app_ui_config.dart';
import 'package:projeto_filmes/modules/home/home_module.dart';
import 'package:projeto_filmes/modules/login/login_module.dart';
import 'package:projeto_filmes/modules/splash/splash_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  RemoteConfig.instance.fetchAndActivate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: FilmesAppUiConfig.title,
        initialBinding: AplicationBindings(),
        theme: FilmesAppUiConfig.theme,
        getPages: [
          ...SplashModule().routers,
          ...LoginModule().routers,
          ...HomeModule().routers,
        ]);
  }
}
