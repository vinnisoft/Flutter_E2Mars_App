import 'package:e2mars/export.dart';

class LoggerX {
  static void write(String text, {bool isError = false}) {
    Future.microtask(() => isError ? log.t(text) : log.i(text));
  }
}
