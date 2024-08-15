import 'package:go_desk_workplace/common/base/abstracts/services/i_base_service.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';

abstract class ILoginApiService extends IBaseService {
  Future<BaseResponseModel<dynamic>> loginWithEmailAndPassword(String email, String password);
}