import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notodo/features/auth/domain/entities/user.dart';

part 'app_state.freezed.dart';

@freezed
class AppStateInfo with _$AppStateInfo {
  const factory AppStateInfo(
      {bool? authenticated,
      bool? offlineMode,
      User? user,
      String? todoId}) = _AppStateInfo;
}
