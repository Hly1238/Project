import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project/model/account.dart';
import 'package:project/services/accountService.dart';

part 'user_bloc_event.dart';
part 'user_bloc_state.dart';

class UserBlocBloc extends Bloc<UserBlocEvent, UserBlocState> {
  final AccountService accountService = AccountService();
  UserBlocBloc() : super(UserBlocInitial()) {
    on<LoginEvent>(loginHandle);
    on<RegisterEvent>(registerHandle);
  }

  Future<void> loginHandle(
      LoginEvent event, Emitter<UserBlocState> emit) async {
    try {
      emit(LoadingState());
      final mess = await accountService.login(
          username: event.username, password: event.password);
      emit(SuccessState(message: mess));
      await Future.delayed(const Duration(seconds: 3));
      emit(UserBlocInitial());
    } catch (e) {
      emit(FailState());
      await Future.delayed(const Duration(seconds: 3));
      emit(UserBlocInitial());
    } finally {
      emit(UserBlocInitial());
    }
  }

  FutureOr<void> registerHandle(
      RegisterEvent event, Emitter<UserBlocState> emit) async {
    try {
      emit(LoadingState());
      final mess = await accountService.register(account: event.newAccount);
      emit(SuccessState(message: mess));
      await Future.delayed(const Duration(seconds: 3));
      emit(UserBlocInitial());
    } catch (e) {
      emit(FailState());
      await Future.delayed(const Duration(seconds: 3));
      emit(UserBlocInitial());
    } finally {
      emit(UserBlocInitial());
    }
  }
}
