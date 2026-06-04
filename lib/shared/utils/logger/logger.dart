import 'package:adhd_app/shared/utils/extensions/string.dart';
import 'package:flutter/widgets.dart';

class Logger {
  const Logger({required this.location});

  final String location;

  static const String _infoColor = '\x1B[36m';
  static const String _warningColor = '\x1B[33m';
  static const String _criticalColor = '\x1B[31m';
  static const String _reset = '\x1B[0m';

  void info(String message, {Object? additionalInfo}) {
    final prefix = _getPrefix(_getCallerMethodName());
    debugPrint("$_infoColor$prefix - $message");
    if (additionalInfo == null) return;
    debugPrint("$_infoColor${additionalInfo.toString()}$_reset");
  }

  void warn(
    String message, {
    Object? additionalInfo,
    bool includeStackTrace = false,
  }) {
    _logErrorOrWarning(
      false,
      message: message,
      additionalInfo: additionalInfo,
      includeStackTrace: includeStackTrace,
    );
  }

  void error(
    String message, {
    Object? additionalInfo,
    bool includeStackTrace = false,
  }) {
    _logErrorOrWarning(
      true,
      message: message,
      additionalInfo: additionalInfo,
      includeStackTrace: includeStackTrace,
    );
  }

  void _logErrorOrWarning(
    bool isError, {
    required String message,
    Object? additionalInfo,
    bool includeStackTrace = false,
  }) {
    final prefix = _getPrefix(_getCallerMethodName());
    final color = isError ? _criticalColor : _warningColor;
    debugPrint("$color$prefix - $message");
    if (additionalInfo == null) return;
    debugPrint("$color${additionalInfo.toString()}$_reset");
    if (!includeStackTrace) return;
    debugPrint("$color${StackTrace.current}$_reset");
  }

  String? _getCallerMethodName() {
    final StackTrace current = StackTrace.current;
    final frames = current.toString().split('\n');
    return frames[2];
  }

  String _getPrefix(String? callerMethodName) {
    return "[$location${callerMethodName.isNullOrEmpty() ? "" : ' - $callerMethodName'}]";
  }
}
