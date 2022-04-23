// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/router/app_router.dart' as _i10;
import 'core/state/app_state_manager.dart' as _i3;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i5;
import 'features/auth/domain/repositories/auth_repository.dart' as _i4;
import 'features/auth/domain/usecases/login_with_email.dart' as _i9;
import 'features/todos/data/repositories/todo_repository_impl.dart' as _i7;
import 'features/todos/data/repositories/todo_repository_impl_dev.dart' as _i8;
import 'features/todos/domain/repositories/todo_repository.dart' as _i6;
import 'features/todos/domain/usecases/get_one_todo.dart' as _i11;
import 'features/todos/domain/usecases/get_todo_list.dart' as _i12;

const String _prod = 'prod';
const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AppStateManager>(_i3.AppStateManager());
  gh.factory<_i4.IAuthRepository>(() => _i5.AuthRepository(),
      registerFor: {_prod});
  gh.factory<_i6.ITodoRepository>(() => _i7.TodoRepository(),
      registerFor: {_prod});
  gh.factory<_i6.ITodoRepository>(() => _i8.DevTodoRepository(),
      registerFor: {_dev});
  gh.factory<_i9.LoginWithEmailUC>(
      () => _i9.LoginWithEmailUC(get<_i4.IAuthRepository>()));
  gh.factory<_i10.AppRouter>(() => _i10.AppRouter(get<_i3.AppStateManager>()));
  gh.factory<_i11.GetOneTodoUC>(
      () => _i11.GetOneTodoUC(get<_i6.ITodoRepository>()));
  gh.factory<_i12.GetTodoListUC>(
      () => _i12.GetTodoListUC(get<_i6.ITodoRepository>()));
  return get;
}
