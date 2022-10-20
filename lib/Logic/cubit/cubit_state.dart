// ignore_for_file: unnecessary_this

part of 'cubit_cubit.dart';

@immutable
abstract class CubitState {}

class CounterState extends Equatable {
  int counterValue;
  bool wasIncremented;

  CounterState({required this.counterValue, required this.wasIncremented});

  @override
  // TODO: implement props
  List get props => [this.counterValue, this.wasIncremented];
}
