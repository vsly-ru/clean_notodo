import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notodo/features/auth/domain/entities/user.dart';

part 'app_state.freezed.dart';

@freezed
class AppStateInfo with _$AppStateInfo {
  const factory AppStateInfo(
      {bool? authenticated, User? user, String? pageId}) = _AppStateInfo;
}
