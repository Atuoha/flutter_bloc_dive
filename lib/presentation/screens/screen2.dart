import 'package:diving_into_flutter_bloc/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildElevatedButton(bloc.decrement, Icons.remove),
                const SizedBox(width: 10),
                buildElevatedButton(bloc.increment, Icons.add),
              ],
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(
      Function action,
      IconData icon,
      ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.all(10),
      ),
      onPressed: () => action(),
      child: Icon(icon),
    );
  }
}
