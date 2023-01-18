import 'package:diving_into_flutter_bloc/cubit/counter_cubit.dart';
import 'package:diving_into_flutter_bloc/presentation/screens/screen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App2'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ThirdScreen(),
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
