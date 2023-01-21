import 'package:diving_into_flutter_bloc/presentation/routing/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubits/counter_cubit.dart';
import 'business_logic/cubits/counter_state.dart';

void main() {
  const CounterState counterState1 = CounterState(
    counterValue: 1,
    wasIncremented: true,
  );

  const CounterState counterState2 = CounterState(
    counterValue: 1,
    wasIncremented: true,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRoute _appRoute = AppRoute();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        onGenerateRoute: _appRoute.onGenerateRoute,
      ),
    );
  }
}
