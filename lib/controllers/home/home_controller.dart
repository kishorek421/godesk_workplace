import 'package:get/get.dart';
import 'package:go_desk_workplace/models/customer/customer_details_model.dart';
import 'package:go_desk_workplace/services/api/customer/customer_api_service.dart';

class HomeController extends GetxController {
  final customerApiService = CustomerApiService();

  final customerDetailsModel = CustomerDetailsModel().obs;

  fetchCustomerDetails() {
    customerApiService.getCustomerDetailsById().then((response) {
      var data = response.data;
      if (data != null) {
        customerDetailsModel.value = data;
      }
    });
  }
}
