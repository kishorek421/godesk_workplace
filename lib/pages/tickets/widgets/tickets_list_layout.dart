import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/models/tickets/ticket_list_model.dart';
import 'package:go_desk_workplace/pages/tickets/widgets/ticket_list_item_layout.dart';

class TicketsListLayout extends StatelessWidget {
  final RxList<TicketListItemModel> ticketsList;
  final VoidCallback loadMoreData;

  final ScrollController _scrollController = ScrollController();

  TicketsListLayout({
    super.key,
    required this.ticketsList,
    required this.loadMoreData,
  }) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        loadMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        child: ticketsList.isEmpty
            ? const Center(
                child: PrimaryText("No tickets found"),
              )
            : ListView.builder(
                controller: _scrollController,
                itemCount: ticketsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: TicketListItemLayout(
                      ticketListItemModel: ticketsList[index],
                    ),
                  );
                },
              ),
      );
    });
  }
}
