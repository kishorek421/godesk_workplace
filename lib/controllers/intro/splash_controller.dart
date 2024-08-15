import 'package:get/get.dart';
import 'package:go_desk_workplace/services/api/common/token_service.dart';

class SplashController extends GetxController {
  final tokenService = TokenService();

  fetchToken() async {
    return tokenService.getToken();
  }
}