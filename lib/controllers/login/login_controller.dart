import 'dart:developer';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/models/login/login_response_model.dart';
import 'package:go_desk_workplace/services/api/login/login_api_service.dart';

class LoginController extends GetxController {
  var apiService = LoginApiService();
  var email = "".obs;
  var password = "".obs;
  var hidePassword = true.obs;

  Future<BaseResponseModel> login(String email, String password) async {
    try {
      final result = await apiService.loginWithEmailAndPassword(email, password);
      return  result;
    } catch (e) {
      log(e.toString());
      return BaseResponseModel(
        success: false,
        message: "Failed to login",
        status: 400,
      );
    }
  }
}
