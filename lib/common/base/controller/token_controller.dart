import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'i_base_controller.dart';

class TokenController<T> extends GetxController
    implements IBaseController {
  final token = "".obs;
  final customerId = "".obs;
  final storage = const FlutterSecureStorage();

  @override
  void onInit() async {
    super.onInit();
    await fetchToken();
    await fetchLeadId();
  }

  Future<String?> _fetchToken() async {
    try {
      return await storage.read(key: "user token");
    } on Exception {
      return null;
    }
  }

  Future<String?> _fetchLeadId() async {
    try {
      return await storage.read(key: "customer id");
    } on Exception {
      return null;
    }
  }

  fetchToken() async {
    await _fetchToken().then((String? value) {
      if (value != null) {
        token.value = value;
      }
    });
  }

  fetchLeadId() async {
    await _fetchLeadId().then((String? value) {
      if (value != null) {
        var intId = int.parse(value);
        customerId.value = intId as String;
      }
    });
  }

  @override
  void fetchData() {
    // TODO: implement fetchData
  }
}
