import 'dart:io';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:go_desk_workplace/common/base/abstracts/services/i_base_service.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/common/constants/api_endpoints.dart';
import 'package:go_desk_workplace/models/tickets/raise_ticket_request_model.dart';
import 'package:go_desk_workplace/models/tickets/ticket_list_model.dart';
import 'package:go_desk_workplace/services/api/tickets/i_tickets_api_service.dart';

class TicketsApiService extends ITicketsApiService {
  @override
  Future<BaseResponseModel<TicketListItemModel?>> raiseTicket(

      RaiseTicketRequestModel raiseTicketModel) async {
    var token = await getToken();

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }

    var iFormData = raiseTicketModel.toJson();

    var assetImages = raiseTicketModel.assetImages;

    var files = List<Map<String, MultipartFile>>.empty(growable: true);

    if (assetImages != null && assetImages.isNotEmpty) {
      for (int i = 0; i < assetImages.length; i++) {
        var img = assetImages[i];
        files.add({
          "assetImages": MultipartFile(File(img),
              filename: 'assetImg$i.jpg', contentType: "multipart/form-data")
        });
      }
    }

    iFormData['assetImages'] = files;

    var formData = FormData(iFormData);

    var headers = {"Authorization": "Bearer $token"};

    var response = await post(
      ApiEndpoints.raiseTicket,
      formData,
      headers: headers,
    );

    var body = response.body ?? {};
    var success = body['success'];
    var data = body['data'];

    if (response.hasError ||
        body == null ||
        success ||
        !(success as bool) ||
        data == null) {
      return handleErrorResponse(body);
    } else {
      return BaseResponseModel(
        status: 201,
        data: TicketListItemModel.fromJson(data),
      );
    }
  }

  @override
  Future<BaseResponseModel<TicketListItemModel?>> getTicketDetails(
      String ticketId) async {
    var token = await getToken();

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }

    var params = "ticketId=$ticketId";

    var response = await get(
      "${ApiEndpoints.getCustomerLeadDetailsById}?$params",
      headers: {"Authorization": "Bearer $token"},
    );
    var body = response.body ?? {};
    var data = body["data"];
    var success = body["success"];
    if (response.status.hasError ||
        success == null && !(success as bool) ||
        data == null) {
      return handleErrorResponse<TicketListItemModel>(body);
    } else {
      return BaseResponseModel(
        data: TicketListItemModel.fromJson(data),
      );
    }
  }

  @override
  Future<BaseResponseModel<TicketListModel>> getTicketListByStatus(
      String status, int pageNo, int pageSize) async {
    var token = await getToken();

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }

    // raised, in_progress, completed
    var params = "status=$status&pageNo=$pageNo&pageSize=$pageSize";

    var response = await get(
      "${ApiEndpoints.getTicketListByStatusKey}?$params",
      headers: {"Authorization": "Bearer $token"},
    );
    var body = response.body ?? {};
    var data = body["data"];
    var success = body["success"];
    if (response.status.hasError ||
        success == null && !(success as bool) ||
        data == null) {
      return handleErrorResponse<TicketListModel>(body);
    } else {
      return BaseResponseModel(
        data: TicketListModel.fromJson(data),
      );
    }
  }
}
