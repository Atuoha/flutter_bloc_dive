import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:diving_into_flutter_bloc/business_logic/cubits/internet_cubit.dart';
import 'package:diving_into_flutter_bloc/presentation/routing/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubits/counter_cubit.dart';
import 'business_logic/cubits/counter_state.dart';

void main() {
  runApp(MyApp(
    appRoute: AppRoute(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.appRoute, this.connectivity});

  final AppRoute? appRoute;
  final Connectivity? connectivity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(
            connectivity: Connectivity(),
          ),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(
            internetCubit: BlocProvider.of<InternetCubit>(context),
          ),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: appRoute!.onGenerateRoute,
      ),
    );
  }
}
