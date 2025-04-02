// counter_state.dart
import 'package:equatable/equatable.dart';

// class CounterState {
//   final int counterValue;

//   CounterState({required this.counterValue});
// }

abstract class UserState
    extends Equatable {} //equatabe: compare variable are they the same or not

class InitialState extends UserState {
  @override
  List<Object?> get props => [];
}

class SuccessState extends UserState {
  final String message;
  SuccessState({required this.message});

  @override
  List<Object?> get props => [];
}

// Each class 4 each state
class LoadingState extends UserState {
  @override
  List<Object?> get props => [];
//overide method of equatable
}
