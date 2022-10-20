import 'package:bloc_test/bloc_test.dart';
import 'package:statemng/Logic/cubit/cubit_cubit.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

void main() {
  group('Counter Cubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test('Check the initial state of the state', () {
      expect(counterCubit.state,
          CounterState(counterValue: 0, wasIncremented: true));
    });

    //This is how we test for the methods for our state

    // blocTest('Texsting for increment',
    //     build: () => counterCubit,
    //     act: (cubit) => cubit.increment(),
    //     expect: [CounterState(counterValue: 0, wasIncremented: true)]);
  });
}
