import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static void write(String text, {bool isError = false}) {
    if (kDebugMode) {
      print('** $text [$isError]');
    }
  }
}

Logger logger = Logger();

iLogger(String msg) {
  /// log on only debug, disable for production
  if (kDebugMode) {
    logger.i(msg);
  }
}

dLogger(String msg) {
  /// log on only debug, disable for production
  if (kDebugMode) {
    logger.d(msg);
  }
}

eLogger(String msg) {
  /// log on only debug, disable for production
  if (kDebugMode) {
    logger.e(msg);
  }
}

wLogger(String msg) {
  /// log on only debug, disable for production
  if (kDebugMode) {
    logger.w(msg);
  }
}
