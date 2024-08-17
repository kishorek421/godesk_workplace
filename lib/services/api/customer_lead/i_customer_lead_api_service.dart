import 'package:go_desk_workplace/common/base/abstracts/services/i_base_service.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/models/customer_lead/customer_lead_details_model.dart';

abstract class ICustomerLeadApiService extends IBaseService {
  Future<BaseResponseModel<CustomerLeadDetailsModel?>>
      getCustomerLeadDetailsById();

  Future<BaseResponseModel<CustomerLeadDetailsModel?>>
      updateCustomerLeadDetails(
          CustomerLeadDetailsModel updateCustomerLeadData, String? orgImagePath, bool isNew);
}
