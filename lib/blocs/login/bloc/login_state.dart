part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class DoLoginLoading extends LoginState {}

final class DoLoginSucess extends LoginState {
  final LoginResponse userLogin;
  DoLoginSucess(this.userLogin);
}

final class GetRequestTokenSuccess extends LoginState {
  GetRequestTokenSuccess();
}

final class GetRequestTokenError extends LoginState {
  final String errorMessage;
  GetRequestTokenError(this.errorMessage);
}
