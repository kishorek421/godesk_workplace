import 'package:flutter/material.dart';

class PrimaryDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double? endIndent;
  final double? indent;
  final double? thickness;

  const PrimaryDivider(
      {super.key,
      required this.height,
      required this.color,
      this.endIndent,
      this.indent,
      this.thickness});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: color,
      endIndent: endIndent,
      indent: indent,
      thickness: thickness,
    );
  }
}
