import 'package:diving_into_flutter_bloc/cubit/counter_cubit.dart';
import 'package:diving_into_flutter_bloc/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit_counter.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App3'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CounterScreen(),
          ),
        ),
        child: const Icon(Icons.chevron_right),
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
