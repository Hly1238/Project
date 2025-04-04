part of 'user_bloc_bloc.dart';

sealed class UserBlocState extends Equatable {
  const UserBlocState();

  @override
  List<Object> get props => [];
}

final class UserBlocInitial extends UserBlocState {}

class LoadingState extends UserBlocState {}

class SuccessState extends UserBlocState {
  final String message;
  const SuccessState({required this.message});
}

class FailState extends UserBlocState {}
