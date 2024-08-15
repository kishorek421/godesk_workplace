import 'package:get/get.dart';
import 'package:go_desk_workplace/models/tickets/ticket_list_model.dart';
import 'package:go_desk_workplace/models/tickets_list_model.dart';
import 'package:go_desk_workplace/services/api/tickets/tickets_api_service.dart';

class TicketListController extends GetxController {
  var ticketsList = List<TicketListItemModel>.empty(growable: true).obs;

  var apiService = TicketsApiService();

  var selectedTab = 0.obs;

  var ticketStatusKeysList = <String?>[
    null,
    "IN_PROGRESS",
    "TICKET_CLOSED",
  ];

  var currentPage = 1;
  var isLastPage = false;

  fetchTicketsList(
    int index,
    int pageNo,
  ) {
    apiService
        .getTicketListByStatus(ticketStatusKeysList[index] ?? "", pageNo, 10)
        .then((value) {
      var data = value.data?.content;
      if (data != null) {
        if (pageNo == 1) {
          ticketsList.value = data;
        } else {
          ticketsList.addAll(data);
          update();
        }
      }
      var paginator = value.data?.paginator;
      if (paginator != null) {
        var currentPage = paginator.currentPage;
        var perPageItemCount = paginator.perPageItemCount;
        var lastPage = paginator.lastPage;

        if (currentPage != null &&
            perPageItemCount != null &&
            lastPage != null) {
          pageNo = currentPage;
          isLastPage = lastPage;
        }
      }
    });
  }
}
