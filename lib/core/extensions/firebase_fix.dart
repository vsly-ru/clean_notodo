import 'dart:convert';

extension FirebaseFormatFiX on Map<Object?, Object?> {
  /// fixes firebase Map<Object,Object> data format
  Map<String, dynamic> get fix =>
      jsonDecode(jsonEncode(this)); // milliseconds duration
}
