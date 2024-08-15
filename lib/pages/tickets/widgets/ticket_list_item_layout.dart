import 'package:flutter/material.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_texts.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/common/utils/helpers.dart';
import 'package:go_desk_workplace/common/widgets/buttons/primary_button.dart';
import 'package:go_desk_workplace/common/widgets/card/flexible_card.dart';
import 'package:go_desk_workplace/common/widgets/divider/divider.dart';
import 'package:go_desk_workplace/models/tickets/ticket_list_model.dart';

class TicketListItemLayout extends StatelessWidget {
  final TicketListItemModel ticketListItemModel;

  const TicketListItemLayout({super.key, required this.ticketListItemModel});

  @override
  Widget build(BuildContext context) {
    return FlexibleCard(
      cardColor: AppColors.whiteColor,
      border: Border.all(
        width: 0.6,
        color: AppColors.black800Color.withOpacity(0.4),
      ),
      borderRadius: BorderRadius.circular(10),
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                AppTexts.ticketIdSemicolon,
                fontWeight: AppThemes.fontSemiBold,
                fontSize: 18,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: PrimaryText(
                    ticketListItemModel.ticketNo ?? "-",
                    fontWeight: AppThemes.fontRegular,
                    fontColor: AppColors.textColor,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryText(
                AppTexts.issueDeviceSemicolon,
                fontWeight: AppThemes.fontSemiBold,
                fontSize: 18,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: PrimaryText(
                    ticketListItemModel
                            .assetInUseDetails?.assetMasterDetails?.serialNo ??
                        "-",
                    fontWeight: AppThemes.fontRegular,
                    fontColor: AppColors.blueColor,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryText(
                AppTexts.issueTypeSemicolon,
                fontWeight: AppThemes.fontSemiBold,
                fontSize: 18,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: PrimaryText(
                    ticketListItemModel.assetInUseDetails?.assetMasterDetails
                            ?.assetTypeDetails?.name ??
                        "-",
                    fontWeight: AppThemes.fontRegular,
                    fontColor: AppColors.textColor,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const PrimaryDivider(
            height: 2,
            color: AppColors.gray500Color,
            indent: 2,
            endIndent: 2,
            thickness: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.access_time,
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              PrimaryText(
                timeAgoFromString(ticketListItemModel.createdAt),
                fontWeight: AppThemes.fontRegular,
                fontSize: 18,
                fontColor: AppColors.textColor,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: PrimaryButton(
                    widthFactor: 0.4,
                    buttonColor: const Color(0xFFE1ECFD),
                    innerVerticalPadding: 8,
                    innerHorizontalPadding: 5,
                    title:
                        ticketListItemModel.ticketStatusDetails?.value ?? "-",
                    fontColor: AppColors.blueColor,
                    fontSize: 15,
                    fontWeight: AppThemes.fontRegular,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
