import 'package:go_desk_workplace/common/base/abstracts/services/i_base_service.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/models/customer/customer_details_model.dart';

abstract class ICustomerApiService extends IBaseService {
  Future<BaseResponseModel<CustomerDetailsModel?>> getCustomerDetailsById();
}
