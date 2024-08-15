import 'package:flutter/material.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/enums/padding_type_enum.dart';

class FlexibleCard extends StatelessWidget {
  final Widget child;

  //final Rx<CardMode> mode;
  //final VoidCallback editOnClickCallback;
  //final Widget title;
  final PaddingType paddingType;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;
  final double horizontalPadding;
  final double verticalPadding;
  final bool isCardEditable;
  final Color? cardColor;
  final double? elevation;
  final Color? shadowColor;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;

  FlexibleCard({
    super.key,
    required this.child,
    //required this.mode,
    //required this.editOnClickCallback,
    //required this.title,
    this.paddingType = PaddingType.symmetric,
    this.leftPadding = 0.0,
    this.rightPadding = 0.0,
    this.topPadding = 0.0,
    this.bottomPadding = 0.0,
    this.horizontalPadding = 15.0,
    this.verticalPadding = 10.0,
    this.isCardEditable = true,
    this.cardColor,
    this.elevation,
    this.shadowColor,
    this.boxShadow,
    this.border,
    this.borderRadius,
  }) {
    // mode.listen((p0) {
    //   log("mode -> $mode");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        border: border,
        borderRadius: borderRadius,
      ),
      child: Card(
        shadowColor: shadowColor,
        color: cardColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: child,
        ),
      ),
    );
  }
}
