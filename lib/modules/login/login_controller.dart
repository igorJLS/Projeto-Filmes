import 'package:get/get.dart';
import 'package:projeto_filmes/application/ui/loader_mixin.dart';
import 'package:projeto_filmes/application/ui/message_mixin.dart';
import 'package:projeto_filmes/services/login/login_services.dart';

class LoginController extends GetxController with LoaderMixin, MessageMixin {
  final loading = false.obs;
  final message = Rxn<MessageModel>();
  final LoginService _loginService;

  LoginController({required LoginService loginService})
      : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  void login() async {
    try {
      loading(true);
      await _loginService.login();
      loading(false);
      message(MessageModel.info(
          title: 'Sucesso', message: 'Login Realizado com Sucesso'));
    } on Exception catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(MessageModel.error(
          title: 'Login Erro', message: 'Erro ao realizar Login'));
    }
  }
}
