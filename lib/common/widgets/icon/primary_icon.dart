import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/enums/card_mode_enum.dart';
import 'package:go_desk_workplace/common/enums/padding_type_enum.dart';

class PrimaryIcon extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final double bgSize;
  final Color bgColor;
  final double borderRadius;
  final double padding;
  final double borderWidth;
  final Color borderColor;
  final Rx<CardMode> mode;
  final bool isCardEditable;
  final VoidCallback editOnClickCallback;
  final PaddingType paddingType;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;
  final double horizontalPadding;
  final double verticalPadding;

  const PrimaryIcon(
    this.icon, {
    super.key,
    this.iconSize = 24.0,
    this.iconColor = Colors.white,
    this.bgSize = 50.0,
    this.bgColor = Colors.black,
    this.borderRadius = 90.0,
    this.padding = 3.0,
    this.borderWidth = 1,
    this.borderColor = Colors.white,
    required this.mode,
    this.isCardEditable = true,
    required this.editOnClickCallback,
    this.paddingType = PaddingType.symmetric,
    this.leftPadding = 0.0,
    this.rightPadding = 0.0,
    this.topPadding = 0.0,
    this.bottomPadding = 0.0,
    this.horizontalPadding = 15.0,
    this.verticalPadding = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: paddingType == PaddingType.symmetric
            ? EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              )
            : EdgeInsets.only(
                left: leftPadding,
                right: rightPadding,
                top: topPadding,
                bottom: bottomPadding,
              ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                mode.value == CardMode.edit && isCardEditable
                    ? InkWell(
                        onTap: () {
                          editOnClickCallback();
                        },
                        child: const SizedBox(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.mode_edit_outline_sharp,
                              color: AppColors.black800Color,
                              size: 18,
                            ),
                          ),
                        ),
                      )
                    : mode.value == CardMode.save
                        ? InkWell(
                            onTap: () {
                              editOnClickCallback();
                            },
                            child: const SizedBox(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.close,
                                  color: AppColors.black800Color,
                                  size: 18,
                                ),
                              ),
                            ),
                          )
                        : const Center(),
              ],
            ),
          ],
        ),
      );
    });
    // return Container(
    //   width: bgSize,
    //   height: bgSize,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(
    //       borderRadius,
    //     ),
    //     border: Border.all(
    //       color: borderColor,
    //       width: borderWidth,
    //     ),
    //     color: bgColor,
    //   ),
    //   padding: EdgeInsets.all(padding),
    //   child: Icon(
    //     icon,
    //     size: iconSize,
    //     color: iconColor,
    //   ),
    // );
  }
}
