import 'package:diving_into_flutter_bloc/business_logic/cubits/internet_cubit.dart';
import 'package:diving_into_flutter_bloc/presentation/screens/screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubits/counter_cubit.dart';
import '../../business_logic/cubits/counter_state.dart';
import 'constants/enums.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);
  static const routeName = "/counter";

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushReplacementNamed(SecondScreen.routeName),
        child: const Icon(Icons.chevron_right),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.wifi) {
                return buildText(
                  text: 'Wi-fi is connected',
                  color: Colors.green,
                );
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.mobile) {
                return buildText(
                  text: 'Mobile Data is connected',
                  color: Colors.blue,
                );
              } else if (state is InternetDisconnected) {
                return buildText(
                  text: 'Internet is not connected',
                  color: Colors.red,
                );
              }
              return const CircularProgressIndicator();
            }),
            const SizedBox(height: 20),
            Builder(builder: (context) {
              final counter = context.watch<CounterCubit>().state;
              final internetState = context.watch<InternetCubit>().state;
              if (internetState is InternetConnected &&
                  internetState.connectionType == ConnectionType.wifi) {
                return buildText(
                  text: 'Counter: ${counter.counterValue} and Wi-fi is connected',
                  color: Colors.green,
                );
              } else if (internetState is InternetConnected &&
                  internetState.connectionType == ConnectionType.mobile) {
                return buildText(
                  text: 'Counter: ${counter.counterValue}  and Mobile Data is connected',
                  color: Colors.blue,
                );
              } else if (internetState is InternetDisconnected) {
                return buildText(
                  text: 'Counter: ${counter.counterValue}  and Internet is not connected',
                  color: Colors.red,
                );
              }
              return const CircularProgressIndicator();
            }),
            const SizedBox(height:20),
            Builder(builder: (context){
              final counter =  context.select((CounterCubit cubit) => cubit.state.counterValue);
              return Text('Counter: $counter');
            },),
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

  // Internet Connection Button
  Text buildText({required String text, required Color color}) => Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: color,
        ),
      );

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
