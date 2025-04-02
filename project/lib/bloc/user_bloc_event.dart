part of 'user_bloc_bloc.dart';

sealed class UserBlocEvent extends Equatable {
  const UserBlocEvent();

  @override
  List<Object> get props => [];
}

// Each event is a class
class LoginEvent extends UserBlocEvent {
  final String username;
  final String password;

  const LoginEvent({required this.username, required this.password});
}

class RegisterEvent extends UserBlocEvent {
  final Account newAccount;

  const RegisterEvent({required this.newAccount});
}
