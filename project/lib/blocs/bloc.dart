// counter_bloc.dart
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/blocs/event.dart';
import 'package:project/blocs/state.dart';
import 'package:project/repos/account.dart';

// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   CounterBloc() : super(CounterState(counterValue: 0)) {
//     on<IncrementEvent>((event, emit) {
//       emit(CounterState(counterValue: state.counterValue + 1));
//     });

//     on<DecrementEvent>((event, emit) {
//       emit(CounterState(counterValue: state.counterValue - 1));
//     });
//   }
// }

class UserBloc extends Bloc<UserEvent, UserState> {
  final Account accountService = Account();
  UserBloc() : super(InitialState()) {
    on<LoginEvent>(LoginHandle);
  }

  FutureOr<void> LoginHandle(LoginEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadingState());
      final mess = await accountService.login(
          username: event.username, password: event.password);
      emit(SuccessState(message: mess));
    } catch (e) {}
  }
}
