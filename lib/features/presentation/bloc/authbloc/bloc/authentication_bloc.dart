// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_management/features/domain/repositories/firebase/auth_repoistory.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepoistory _authRepoistory;
  AuthenticationBloc({required AuthRepoistory authrepository})
      : _authRepoistory = authrepository,
        super(AuthenticationInitial()) {
    on<SignupRequested>(_onsignupRequested);
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<GoogleLoginRequested>(_onGoogleLoginRequested);
  }

  //sign up bloc

  Future<void> _onsignupRequested(
    SignupRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    final result = await _authRepoistory.signupUser(
        name: event.name, email: event.email, password: event.password);
    if (result == 'Success') {
      emit(AuthenticationSuccess(
          userId: _authRepoistory.currentuser!.uid, source: 'signup'));
    } else {
      emit(AuthenticationFailure(error: result, source: 'signup'));
    }
  }

  // login bloc
  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    final result = await _authRepoistory.loginUser(
        email: event.email, password: event.password);
    if (result == 'Success') {
      emit(AuthenticationSuccess(
          userId: _authRepoistory.currentuser!.uid, source: 'login'));
    } else {
      emit(AuthenticationFailure(error: result, source: 'login'));
    }
  }

  // google bloc

  Future<void> _onGoogleLoginRequested(
    GoogleLoginRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    final result = await _authRepoistory.loginWithgoogle();
    if (result == 'Success') {
      emit(AuthenticationSuccess(
          userId: _authRepoistory.currentuser!.uid, source: 'google'));
    } else {
      emit(AuthenticationFailure(error: result, source: 'google'));
    }
  }

  //logout bloc

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    await _authRepoistory.logout();
    emit(AuthenticationLoggedout());
  }
}
