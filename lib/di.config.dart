// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/actions/delegated_actions.dart' as _i13;
import 'core/platform_channel/platform_channel.dart' as _i14;
import 'core/router/app_router.dart' as _i17;
import 'core/state/app_state_manager.dart' as _i3;
import 'features/auth/data/repositories/auth_repository_dev.dart' as _i6;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i5;
import 'features/auth/domain/repositories/auth_repository.dart' as _i4;
import 'features/auth/domain/usecases/login_with_email.dart' as _i10;
import 'features/auth/domain/usecases/logout.dart' as _i11;
import 'features/auth/domain/usecases/register_with_email.dart' as _i15;
import 'features/todos/data/repositories/todo_repository_dev.dart' as _i9;
import 'features/todos/data/repositories/todo_repository_impl.dart' as _i8;
import 'features/todos/domain/repositories/todo_repository.dart' as _i7;
import 'features/todos/domain/usecases/add_update_todo.dart' as _i16;
import 'features/todos/domain/usecases/get_one_todo.dart' as _i18;
import 'features/todos/domain/usecases/get_todo_list.dart' as _i19;
import 'features/todos/presentation/actions/open_add_edit_page.dart' as _i12;

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
  gh.factory<_i4.IAuthRepository>(() => _i6.DevAuthRepository(),
      registerFor: {_dev});
  gh.factory<_i7.ITodoRepository>(() => _i8.TodoRepository(),
      registerFor: {_prod});
  gh.factory<_i7.ITodoRepository>(() => _i9.DevTodoRepository(),
      registerFor: {_dev});
  gh.factory<_i10.LoginWithEmailUC>(
      () => _i10.LoginWithEmailUC(get<_i4.IAuthRepository>()));
  gh.factory<_i11.LogoutUC>(() => _i11.LogoutUC(get<_i4.IAuthRepository>()));
  gh.factory<_i12.OpenAddEditPageAction>(
      () => _i12.OpenAddEditPageAction(get<_i13.DelegatedActions>()));
  gh.singleton<_i14.PlatformChannel>(_i14.PlatformChannel());
  gh.factory<_i15.RegisterWithEmailUC>(
      () => _i15.RegisterWithEmailUC(get<_i4.IAuthRepository>()));
  gh.factory<_i16.AddUpdateTodoUC>(
      () => _i16.AddUpdateTodoUC(get<_i7.ITodoRepository>()));
  gh.factory<_i17.AppRouter>(() => _i17.AppRouter(get<_i3.AppStateManager>()));
  gh.factory<_i18.GetOneTodoUC>(
      () => _i18.GetOneTodoUC(get<_i7.ITodoRepository>()));
  gh.factory<_i19.GetTodoListUC>(
      () => _i19.GetTodoListUC(get<_i7.ITodoRepository>()));
  return get;
}
