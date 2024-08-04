part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginFailure extends AuthState {
  final String message;
  LoginFailure({required this.message});
}

final class LoginSuccess extends AuthState {
  final UserModel user;
  LoginSuccess({required this.user});
}

final class RegisterLoading extends AuthState {}

final class RegisterFailure extends AuthState {
  final String message;
  RegisterFailure({required this.message});
}

final class RegisterSuccess extends AuthState {
  final UserModel user;
  RegisterSuccess({required this.user});
}
