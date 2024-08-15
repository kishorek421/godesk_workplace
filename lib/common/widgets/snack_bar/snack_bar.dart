import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/logger/app_logger.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';

SnackbarController showSnackBar(
  String msg,
) {
  try {
    Get.closeAllSnackbars();
  } on Exception catch (e) {
    eLogger(e.toString());
  }
  return Get.snackbar(
    "",
    "",
    backgroundColor: Colors.grey[100],
    titleText: const PrimaryText(
      "",
      fontSize: 0,
    ),
    messageText: PrimaryText(
      msg,
      fontWeight: FontWeight.w400,
      fontColor: Colors.grey[800],
    ),
    padding: const EdgeInsets.all(20.0),
    margin: const EdgeInsets.only(
      left: 20.0,
      right: 20.0,
      top: 10.0,
    ),
  );
}
