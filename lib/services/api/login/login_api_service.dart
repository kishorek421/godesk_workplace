import 'package:go_desk_workplace/common/base/abstracts/services/i_base_service.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/common/constants/api_endpoints.dart';
import 'package:go_desk_workplace/models/login/login_response_model.dart';
import 'package:go_desk_workplace/services/api/login/i_login_api_services.dart';

class LoginApiService extends ILoginApiService {
  @override
  Future<BaseResponseModel<LoginResponseModel>> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    var requestBody = {
      'email': email,
      'password': password,
    };

    final response = await post(ApiEndpoints.login, requestBody);

    var body = response.body ?? {};
    var success = body["success"];
    var statusCode = body["statusCode"];
    var data = body["data"];


    if (response.hasError || success == null || !(success as bool) || statusCode == null || data == null) {
      return handleErrorResponse(body);
    } else {
      return BaseResponseModel(
        success: true,
        status: statusCode,
        data: LoginResponseModel.fromJson(data)
      );
    }
  }
}
