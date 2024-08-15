import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/common/base/models/errors_model.dart';
import 'package:go_desk_workplace/common/constants/api_endpoints.dart';
import 'package:go_desk_workplace/common/constants/storage_constants.dart';

abstract class IBaseService extends GetConnect {
  Future<String?> getToken() async {
    const sStorage = FlutterSecureStorage();
    var token = await sStorage.read(
      key: StorageConstants.jwtToken,
    );
    if (token == null) {
      return null;
    }
    var isValidToken = await validateToken(token);
    if (isValidToken) {
      return token;
    }
    var refreshToken = await const FlutterSecureStorage().read(
      key: StorageConstants.refreshToken,
    );
    if (refreshToken == null) {
      return null;
    }
    var newToken = await fetchRefreshToken(refreshToken);
    if (newToken != null) {
      await sStorage.write(key: StorageConstants.jwtToken, value: newToken);
      return newToken;
    }
    return null;
  }

  Future<String?> getRefreshToken() async {
    return await const FlutterSecureStorage()
        .read(key: StorageConstants.refreshToken);
  }

  Future<String?> getCustomerLeadId() async {
    return await const FlutterSecureStorage()
        .read(key: StorageConstants.customerLeadIdKey);
  }

  Future<bool> validateToken(String token) async {
    var params = "token=$token";
    var response = await post("${ApiEndpoints.validateToken}?$params", {});
    if (!response.hasError) {
      var body = response.body;
      if (body != null) {
        return body['success'] ?? false;
      }
    }
    return false;
  }

  Future<String?> fetchRefreshToken(String refreshToken) async {
    var params = "refreshToken=$refreshToken";
    var response = await get("${ApiEndpoints.refreshToken}?$params");
    if (!response.hasError) {
      var body = response.body;
      if (body != null) {
        var data = body['data'];
        if (data != null) {
          return data['accessToken'];
        }
        return body['success'] ?? false;
      }
    }
    return null;
  }

  BaseResponseModel<T> handleErrorResponse<T>(Map<dynamic, dynamic> body) {
    var msg = body["message"];
    var status = body["status"];
    try {
      if (msg != null) {
        var errorListModel = List<ErrorItemModel>.empty(growable: true);
        var errors = body["errors"];
        if (errors != null && (errors as List).isNotEmpty) {
          for (var error in errors as List) {
            errorListModel.add(ErrorItemModel.fromJson(error));
          }
        }
        return BaseResponseModel(
          status: status,
          success: false,
          message: msg,
          errors: ErrorListModel(data: errorListModel),
        );
      }
    } catch (e) {
      log(e.toString());
    }
    return BaseResponseModel(
        status: 400, success: false, message: "Failed to process the request");
  }
}
