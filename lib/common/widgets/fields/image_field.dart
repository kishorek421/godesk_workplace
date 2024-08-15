// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:go_desk_workplace/common/constants/app_colors.dart';
// import 'package:go_desk_workplace/common/enums/card_mode_enum.dart';
// import 'package:go_desk_workplace/common/texts/primary_text.dart';
// import 'package:go_desk_workplace/common/widgets/camera/file_picker_bottomsheet.dart';
// import 'package:go_desk_workplace/controllers/base_controller.dart';
// import 'package:go_desk_workplace/controllers/customer_lead/customer_lead_controller.dart';
//
// class ImageField extends StatelessWidget {
//   final VoidCallback onTap;
//   final Rx<String> path;
//   final Rx<bool> isPathValid;
//   final String label;
//   final Rx<CardMode> cardMode;
//   final RxBool isUpdatable;
//   final bool isRequired;
//   final double width;
//   final Color? cardColor;
//   final double elevation;
//   final double height;
//   final BoxFit? boxFit;
//
//   ImageField({
//     super.key,
//     required this.onTap,
//     required this.path,
//     required this.isPathValid,
//     required this.label,
//     required this.cardMode,
//     required this.isUpdatable,
//     this.isRequired = true,
//     required this.width,
//     this.cardColor,
//     required this.elevation,
//     required this.height,
//     this.boxFit,
//   });
//
//   BaseHomePageController controller = Get.put(BaseHomePageController());
//   CustomerLeadController customerLeadController =Get.put(CustomerLeadController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Align(
//           alignment: Alignment.center,
//           child: PrimaryText(
//             label,
//             fontWeight: FontWeight.w400,
//             fontSize: 16,
//             fontColor: AppColors.black800Color,
//           ),
//         ),
//         Obx(
//           () {
//             return Card(
//               color: AppColors.whiteColor,
//               margin: EdgeInsets.zero,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               elevation: elevation,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: cardMode.value == CardMode.edit
//                     ? Image.file(
//                         File(customerLeadController.selectedOrgImagePath.value),
//                         width: width,
//                         height: height,
//                         fit: boxFit,
//                       )
//                     : cardMode.value == CardMode.save
//                         ? Stack(
//                             children: [
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(5),
//                                 child: Image.file(
//                                   File(customerLeadController.selectedOrgImagePath.value),
//                                   width: width,
//                                   height: height,
//                                   fit: boxFit,
//                                 ),
//                               ),
//                               Positioned(
//                                 left: 0,
//                                 right: 0,
//                                 child: Container(
//                                   width: width,
//                                   height: height,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8),
//                                     color: AppColors.black800Color
//                                         .withOpacity(0.5),
//                                   ),
//                                   child: InkWell(
//                                     onTap: () async {
//                                       await Get.bottomSheet(
//                                         FilePickerBottomSheet(),
//                                         isScrollControlled: true,
//                                       );
//                                     },
//                                     child: const Icon(
//                                       Icons.add_a_photo,
//                                       size: 25,
//                                       color: AppColors.whiteColor,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           )
//                         : const Center(),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
