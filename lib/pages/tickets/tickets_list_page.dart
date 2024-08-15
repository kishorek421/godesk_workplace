import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_icons.dart';
import 'package:go_desk_workplace/common/constants/app_texts.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/controllers/home/home_controller.dart';
import 'package:go_desk_workplace/controllers/tickets/tickets_list_controller.dart';
import 'package:go_desk_workplace/pages/tickets/rasie_ticket_page.dart';
import 'package:go_desk_workplace/pages/tickets/widgets/tickets_list_layout.dart';

class TicketsListPage extends StatefulWidget {
  const TicketsListPage({super.key});

  @override
  State<TicketsListPage> createState() => _TicketsListPageState();
}

class _TicketsListPageState extends State<TicketsListPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 3, vsync: this);

  final TicketListController ticketListController =
      Get.put(TicketListController());
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    ticketListController.currentPage = 1;
    ticketListController.fetchTicketsList(
        ticketListController.selectedTab.value, 1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.to(
                    () => RaiseTicketPage(
                      customerId:
                          homeController.customerDetailsModel.value.id ?? "",
                    ),
                  );
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.gray200Color,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Center(
                        child: SvgPicture.asset(
                          AppIcons.raiseTicketIcon,
                          width: 20,
                          height: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Center(
                        child: PrimaryText(
                          AppTexts.raiseATicket,
                          fontWeight: AppThemes.fontSemiBold,
                          fontSize: 20,
                        ),
                      ),
                      const Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TabBar(
                labelColor: AppColors.primaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: const TextStyle(
                  fontSize: 14,
                ),
                unselectedLabelColor: AppColors.black800Color,
                controller: tabController,
                tabs: const [
                  Tab(text: AppTexts.allTickets),
                  Tab(text: AppTexts.onGoing),
                  Tab(text: AppTexts.completed),
                ],
                onTap: (index) {
                  ticketListController.selectedTab.value = index;
                  ticketListController.fetchTicketsList(index, 1);
                },
              ),
              Expanded(
                child: TicketsListLayout(
                  ticketsList: ticketListController.ticketsList,
                  loadMoreData: () {
                    if (!ticketListController.isLastPage) {
                      ticketListController.fetchTicketsList(
                          ticketListController.selectedTab.value,
                          ticketListController.currentPage + 1);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
