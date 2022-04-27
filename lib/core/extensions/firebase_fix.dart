import 'dart:convert';

extension FirebaseFormatFiX on Map<Object?, Object?> {
  /// fix firebase Map<Object?,Object?> data format to readable <String, dynamic>
  Map<String, dynamic> get fix => jsonDecode(jsonEncode(this));
  // not very performant solution ofc 🤷‍♂️
  // TODO: find faster solution
}
