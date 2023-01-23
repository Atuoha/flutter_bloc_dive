import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:diving_into_flutter_bloc/constants/enums.dart';
import 'internet_cubit.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription connectionSubscription;

  CounterCubit({required this.internetCubit})
      : super(const CounterState(counterValue: 0, wasIncremented: false)) {
    connectionSubscription = monitorInternetCubit();
  }

  StreamSubscription<InternetState> monitorInternetCubit() {
    return internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.wifi) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.mobile) {
        decrement();
      }
    });
  }

  void increment() => emit(
        CounterState(
          counterValue: state.counterValue + 1,
          wasIncremented: true,
        ),
      );

  void decrement() => emit(
        CounterState(
          counterValue: state.counterValue - 1,
          wasIncremented: false,
        ),
      );

  @override
  Future<void> close() {
    connectionSubscription.cancel();
    return super.close();
  }
}
