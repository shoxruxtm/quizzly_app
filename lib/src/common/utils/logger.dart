import 'dart:developer' as console;

void Function(Object? message) fine = _log("FINE", 500);
void Function(Object? message) info = _log("INFO", 800);
void Function(Object? message, [StackTrace? stackTrace]) shout =
    _log("SHOUT", 1200);

// void fine(Object? message) => console.log(
//       "[FINE] $message",
//       level: 500,
//     );
//
// void info(Object? message) => console.log(
//       "[INFO] $message",
//       level: 800,
//     );
//
// void shout(Object? message, [StackTrace? stackTrace]) => console.log(
//       "[SHOUT] $message",
//       level: 1200,
//       error: message is Error || message is Exception ? message : null,
//     );

void Function(Object? message, [StackTrace? stackTrace]) _log(
  String prefix,
  int level,
) {
  return (Object? message, [StackTrace? stackTrace]) {
    console.log(
      "[$prefix] $message",
      level: level,
      error: message is Error || message is Exception ? message : null,
      stackTrace: stackTrace,
    );
  };
}
