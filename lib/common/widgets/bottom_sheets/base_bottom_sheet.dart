import 'package:flutter/material.dart';
import 'package:go_desk_workplace/common/enums/padding_type_enum.dart';
import 'package:go_desk_workplace/common/widgets/bottom_sheets/base_bottom_sheet_divider.dart';


class BaseBottomSheet extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final double verticalPadding;
  final double horizontalPadding;
  final double headerLineWidth;
  final PaddingType paddingType;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;

  const BaseBottomSheet({
    Key? key,
    required this.child,
    this.height = double.infinity,
    this.width = double.infinity,
    this.verticalPadding = 20.0,
    this.horizontalPadding = 20.0,
    this.headerLineWidth = 150,
    this.paddingType = PaddingType.symmetric,
    this.leftPadding = 0.0,
    this.rightPadding = 0.0,
    this.topPadding = 0.0,
    this.bottomPadding = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          bottomSheetHeadDivider(headerLineWidth: headerLineWidth),
          Expanded(
            child: Padding(
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
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
