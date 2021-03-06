// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app_delegated_actions.dart' as _i8;
import 'core/actions/delegated_actions.dart' as _i7;
import 'core/router/app_router.dart' as _i19;
import 'core/state/app_state_manager.dart' as _i3;
import 'features/auth/data/repositories/auth_repository_dev.dart' as _i6;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i5;
import 'features/auth/domain/repositories/auth_repository.dart' as _i4;
import 'features/auth/domain/usecases/login_with_email.dart' as _i12;
import 'features/auth/domain/usecases/logout.dart' as _i13;
import 'features/auth/domain/usecases/register_with_email.dart' as _i16;
import 'features/auth/presentation/cubit/login_cubit.dart' as _i22;
import 'features/todos/data/repositories/todo_repository_dev.dart' as _i10;
import 'features/todos/data/repositories/todo_repository_impl.dart' as _i11;
import 'features/todos/domain/repositories/todo_repository.dart' as _i9;
import 'features/todos/domain/usecases/get_one_todo.dart' as _i20;
import 'features/todos/domain/usecases/get_todo_list.dart' as _i21;
import 'features/todos/domain/usecases/save_todo.dart' as _i17;
import 'features/todos/presentation/actions/open_add_page%20copy.dart' as _i14;
import 'features/todos/presentation/actions/open_view_edit_page.dart' as _i15;
import 'features/todos/presentation/cubit/todo_add_edit_cubit.dart' as _i18;
import 'features/todos/presentation/cubit/todo_list_cubit.dart' as _i23;

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
  gh.singleton<_i7.IDelegatedActions>(
      _i8.AppDelegatedActions(get<_i3.AppStateManager>()));
  gh.factory<_i9.ITodoRepository>(() => _i10.DevTodoRepository(),
      registerFor: {_dev});
  gh.factory<_i9.ITodoRepository>(() => _i11.TodoRepository(),
      registerFor: {_prod});
  gh.factory<_i12.LoginWithEmailUC>(
      () => _i12.LoginWithEmailUC(repository: get<_i4.IAuthRepository>()));
  gh.factory<_i13.LogoutUC>(
      () => _i13.LogoutUC(repository: get<_i4.IAuthRepository>()));
  gh.factory<_i14.OpenAddPageAction>(
      () => _i14.OpenAddPageAction(get<_i7.IDelegatedActions>()));
  gh.factory<_i15.OpenViewEditPageAction>(
      () => _i15.OpenViewEditPageAction(get<_i7.IDelegatedActions>()));
  gh.factory<_i16.RegisterWithEmailUC>(
      () => _i16.RegisterWithEmailUC(repository: get<_i4.IAuthRepository>()));
  gh.factory<_i17.SaveTodoUC>(
      () => _i17.SaveTodoUC(get<_i9.ITodoRepository>()));
  gh.factory<_i18.TodoAddEditCubit>(
      () => _i18.TodoAddEditCubit(get<_i17.SaveTodoUC>()));
  gh.factory<_i19.AppRouter>(() =>
      _i19.AppRouter(get<_i3.AppStateManager>(), get<_i7.IDelegatedActions>()));
  gh.factory<_i20.GetOneTodoUC>(
      () => _i20.GetOneTodoUC(get<_i9.ITodoRepository>()));
  gh.factory<_i21.GetTodoListUC>(
      () => _i21.GetTodoListUC(get<_i9.ITodoRepository>()));
  gh.factory<_i22.LoginCubit>(() => _i22.LoginCubit(
      get<_i3.AppStateManager>(),
      get<_i12.LoginWithEmailUC>(),
      get<_i16.RegisterWithEmailUC>(),
      get<_i13.LogoutUC>()));
  gh.factory<_i23.TodoListCubit>(() => _i23.TodoListCubit(
      get<_i21.GetTodoListUC>(),
      get<_i14.OpenAddPageAction>(),
      get<_i15.OpenViewEditPageAction>()));
  return get;
}
