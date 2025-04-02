import 'package:equatable/equatable.dart';

// abstract class CounterEvent {}

// class IncrementEvent extends CounterEvent {}

// class DecrementEvent extends CounterEvent {}

abstract class UserEvent extends Equatable {
  const UserEvent();
}

// Each event is a class
class LoginEvent extends UserEvent {
  final String username;
  final String password;

  LoginEvent({required this.username, required this.password});
  @override
  List<Object?> get props => [];
}
