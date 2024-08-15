import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_texts.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/models/organization_device_details_model.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/common/widgets/card/flexible_card.dart';
import 'package:go_desk_workplace/controllers/base_controller.dart';
import 'package:go_desk_workplace/pages/devices/device_overall_detail_page.dart';
import 'package:go_desk_workplace/pages/organization/organization_profile_page.dart';

class DevicesPage extends StatelessWidget {
  DevicesPage({super.key});

  final BaseHomePageController controller = Get.put(BaseHomePageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 20,
            ),
          ),
          title: const PrimaryText(
            AppTexts.devices,
            fontSize: 25,
            fontWeight: AppThemes.fontBold,
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Get.to(
                  () => OrganizationPage(
                      // moveCallback: () {},
                      // saveBtnCallback: (
                      //     {required canGoNext, required visibility}) {},
                      // showToastCallback: ({required msg}) {},
                      // isUpdate: true,
                      // isNextDetailsFilled: true,
                      ),
                );
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColors.gray500Color.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text("P"),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const PrimaryText(
                  AppTexts.organizationDevices,
                  fontSize: 20,
                  fontWeight: AppThemes.fontBold,
                ),
                const SizedBox(
                  height: 20,
                ),
                FlexibleCard(
                  cardColor: AppColors.whiteColor,
                  elevation: 0.6,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 15,
                      color: AppColors.gray200Color,
                    ),
                  ],
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          DataColumn(
                              label: Text('Type',
                                  style: controller.mainCellTextStyle)),
                          DataColumn(
                              label: Text('Brand',
                                  style: controller.mainCellTextStyle)),
                          DataColumn(
                              label: Text('Model',
                                  style: controller.mainCellTextStyle)),
                          DataColumn(
                              label: Text('Serial No',
                                  style: controller.mainCellTextStyle)),
                        ],
                        rows: data.map((item) {
                          Device device = Device(
                            type: item[AppTexts.type] ?? '',
                            brand: item[AppTexts.brand] ?? '',
                            model: item[AppTexts.model] ?? '',
                            serialNo: item[AppTexts.serialNo] ?? '',
                          );
                          return DataRow(
                            cells: [
                              DataCell(Text(device.type,
                                  style: controller.secondaryCellTextStyle)),
                              DataCell(Text(device.brand,
                                  style: controller.secondaryCellTextStyle)),
                              DataCell(Text(device.model,
                                  style: controller.secondaryCellTextStyle)),
                              DataCell(InkWell(
                                onTap: () {
                                  navigateToDeviceDetailPage(device);
                                },
                                child: Text(device.serialNo,
                                    style: controller.serialNoCellTextStyle),
                              )),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToDeviceDetailPage(Device device) {
    Get.to(
      DeviceOverallDetailPage(device: device),
    );
  }

  final List<Map<String, String>> data = [
    {
      AppTexts.type: "Desktop",
      AppTexts.brand: "Dell",
      AppTexts.model: "inspiron 14 plus",
      AppTexts.serialNo: "508373823",
    },
    {
      AppTexts.type: "Desktop",
      AppTexts.brand: "Dell",
      AppTexts.model: "inspiron 142 plus",
      AppTexts.serialNo: "508373423",
    },
    {
      AppTexts.type: "Desktop",
      AppTexts.brand: "Dell",
      AppTexts.model: "inspiron 4500 plus",
      AppTexts.serialNo: "508373123",
    },
    {
      AppTexts.type: "Desktop",
      AppTexts.brand: "Dell",
      AppTexts.model: "inspiron 10 plus",
      AppTexts.serialNo: "508373923",
    },
  ];
}
