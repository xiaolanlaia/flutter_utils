import 'package:logger/logger.dart';

class LogUtils {
  static const String tag = "__LogUtils";
  static bool inProduction = const bool.fromEnvironment("dart.vm.product");
  static Logger logger = Logger();

  static void i(String msg, {String tag = tag}) {
    if (!inProduction) {
      logger.i(msg);
    }
  }

  static void d(String msg, {String tag = tag}) {
    if (!inProduction) {
      logger.d(msg);
    }
  }

  static void w(String msg, {String tag = tag}) {
    if (!inProduction) {
      logger.w(msg);
    }
  }

  static void e(String msg, {String tag = tag}) {
    if (!inProduction) {
      logger.e(msg);
    }
  }
}
