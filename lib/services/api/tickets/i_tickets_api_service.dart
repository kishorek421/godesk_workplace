import 'package:go_desk_workplace/common/base/abstracts/services/i_base_service.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/models/tickets/raise_ticket_request_model.dart';
import 'package:go_desk_workplace/models/tickets/ticket_list_model.dart';

abstract class ITicketsApiService extends IBaseService {
  Future<BaseResponseModel<TicketListItemModel?>> getTicketDetails(
      String ticketId);

  Future<BaseResponseModel<TicketListModel>> getTicketListByStatus(
      String status, int pageNo, int pageSize);

  Future<BaseResponseModel<TicketListItemModel?>> raiseTicket(
      RaiseTicketRequestModel raiseTicketModel);
}
