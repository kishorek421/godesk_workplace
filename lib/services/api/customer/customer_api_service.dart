import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/common/constants/api_endpoints.dart';
import 'package:go_desk_workplace/models/customer/customer_details_model.dart';
import 'package:go_desk_workplace/services/api/customer/i_customer_api_service.dart';

class CustomerApiService extends ICustomerApiService {
  @override
  Future<BaseResponseModel<CustomerDetailsModel?>>
      getCustomerDetailsById() async {
    var token = await getToken();
    //print(token);

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }

    var response = await get(
      ApiEndpoints.getCustomerDetailsById,
      headers: {"Authorization": "Bearer $token"},
    );
    var body = response.body ?? {};
    var success = body["success"];
    var data = body["data"];

    if (response.hasError ||
        success == null ||
        data == null ||
        !(success as bool)) {
      return handleErrorResponse<CustomerDetailsModel>(body);
    } else {
      return BaseResponseModel<CustomerDetailsModel?>(
        success: true,
        data: CustomerDetailsModel.fromJson(data),
      );
    }
  }
}
