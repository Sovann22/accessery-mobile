import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

enum LogLevel {
  debug,
  info,
  warning,
  error,
  critical,
}

class AppLogger {
  static const String _name = 'PhoneAccessoryStore';
  
  // Private constructor to prevent instantiation
  AppLogger._();
  
  // Singleton instance
  static final AppLogger _instance = AppLogger._();
  static AppLogger get instance => _instance;
  
  // Log level colors for console output
  static const Map<LogLevel, String> _colors = {
    LogLevel.debug: '\x1B[37m',    // White
    LogLevel.info: '\x1B[34m',     // Blue
    LogLevel.warning: '\x1B[33m',  // Yellow
    LogLevel.error: '\x1B[31m',    // Red
    LogLevel.critical: '\x1B[35m', // Magenta
  };
  
  static const String _reset = '\x1B[0m'; // Reset color
  
  // Main logging method
  void _log(LogLevel level, String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    // Only log in debug mode or for errors/critical issues
    if (!kDebugMode && level != LogLevel.error && level != LogLevel.critical) {
      return;
    }
    
    final timestamp = DateTime.now().toIso8601String();
    final logTag = tag ?? _name;
    final levelName = level.name.toUpperCase();
    
    // Format the message
    final formattedMessage = '[$timestamp] [$levelName] [$logTag] $message';
    
    // Use developer.log for better debugging experience
    developer.log(
      message,
      time: DateTime.now(),
      level: _getLevelValue(level),
      name: logTag,
      error: error,
      stackTrace: stackTrace,
    );
    
    // Also output to console with colors in debug mode
    if (kDebugMode) {
      final color = _colors[level] ?? '';
      debugPrint('$color$formattedMessage$_reset');
      
      if (error != null) {
        debugPrint('${_colors[LogLevel.error]}Error: $error$_reset');
      }
      
      if (stackTrace != null) {
        debugPrint('${_colors[LogLevel.error]}StackTrace: $stackTrace$_reset');
      }
    }
  }
  
  // Convert LogLevel to int for developer.log
  int _getLevelValue(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return 500;
      case LogLevel.info:
        return 800;
      case LogLevel.warning:
        return 900;
      case LogLevel.error:
        return 1000;
      case LogLevel.critical:
        return 1200;
    }
  }
  
  // Convenience methods
  void debug(String message, {String? tag}) {
    _log(LogLevel.debug, message, tag: tag);
  }
  
  void info(String message, {String? tag}) {
    _log(LogLevel.info, message, tag: tag);
  }
  
  void warning(String message, {String? tag, Object? error}) {
    _log(LogLevel.warning, message, tag: tag, error: error);
  }
  
  void error(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.error, message, tag: tag, error: error, stackTrace: stackTrace);
  }
  
  void critical(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.critical, message, tag: tag, error: error, stackTrace: stackTrace);
  }
  
  // Method for logging API calls
  void apiCall(String method, String url, {int? statusCode, String? tag}) {
    final message = '$method $url${statusCode != null ? ' - Status: $statusCode' : ''}';
    info(message, tag: tag ?? 'API');
  }
  
  // Method for logging user actions
  void userAction(String action, {Map<String, dynamic>? data, String? tag}) {
    final message = 'User Action: $action${data != null ? ' - Data: $data' : ''}';
    info(message, tag: tag ?? 'USER');
  }
  
  // Method for logging performance metrics
  void performance(String operation, Duration duration, {String? tag}) {
    final message = 'Performance: $operation took ${duration.inMilliseconds}ms';
    info(message, tag: tag ?? 'PERFORMANCE');
  }
}

// Global logger instance for easy access
final logger = AppLogger.instance;
