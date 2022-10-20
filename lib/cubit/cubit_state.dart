part of 'cubit_cubit.dart';

@immutable
abstract class CubitState {}

class CounterState {
  int counterValue;
  bool wasIncremented;

  CounterState({required this.counterValue, required this.wasIncremented});
}
