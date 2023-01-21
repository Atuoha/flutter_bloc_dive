import 'package:bloc_test/bloc_test.dart';
import 'package:diving_into_flutter_bloc/business_logic/cubits/counter_cubit.dart';
import 'package:diving_into_flutter_bloc/business_logic/cubits/counter_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit = CounterCubit();
    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test(
      'the initial state of the CounterCubit is CounterState(counterValue: 0)',
      () => expect(
        counterCubit.state,
        const CounterState(counterValue: 0, wasIncremented: false),
      ),
    );

    blocTest(
      'This is the value of the cubitCounter which changes CounterState(counterValue:1, wasIncremented:true) when cubit.increment() function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [const CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest(
      'This is the value of the cubitCounter which changes CounterState(counterValue:-1, wasIncremented:false) when cubit.increment() function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [const CounterState(counterValue: -1, wasIncremented: true)],
    );
  });
}
