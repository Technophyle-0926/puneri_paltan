import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

// Global Logger instance
final Logger logger = Logger(
  level: kReleaseMode
      ? Level.warning
      : Level.debug, // Debug in dev, warning in prod
  printer: PrettyPrinter(
    methodCount: 2, // Number of stack trace lines to show
    errorMethodCount: 5, // Number of stack trace lines for errors
    lineLength: 120, // Maximum line length for log output
    colors: true, // Enable colorful logs
    printEmojis: true, // Include emojis in logs
    dateTimeFormat: DateTimeFormat.dateAndTime,
  ),
);
