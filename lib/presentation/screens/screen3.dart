import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubits/counter_cubit.dart';
import '../../business_logic/cubits/counter_state.dart';
import '../../cubit_counter.dart';


class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);
  static const routeName = "/thirdScreen";

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App 3'),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushReplacementNamed(
            CounterScreen.routeName
        ),
        child: const Icon(Icons.chevron_right),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).primaryColor,
                      content: const Text('Incremented!'),
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).primaryColor,
                      content: const Text('Decremented!'),
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) => Text(
                state.counterValue.toString(),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
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
