import 'package:get/get.dart';
import 'package:go_desk_workplace/models/tickets/ticket_list_model.dart';
import 'package:go_desk_workplace/services/api/tickets/tickets_api_service.dart';

class TicketDetailsPageController extends GetxController {
  var ticketDetailsModel = TicketListItemModel().obs;

  var apiService = TicketsApiService();

  fetchTicketDetails(String ticketId) {
    apiService.getTicketDetails(ticketId).then((value) {
      var data = value.data;
      if (data != null) {
        ticketDetailsModel.value = data;
      }
    });
  }
}