import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggerUtils extends LogFilter {
  Logger get getLogger => Logger();

  @override
  bool shouldLog(LogEvent event) => kDebugMode;
}
