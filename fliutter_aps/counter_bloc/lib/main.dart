import 'package:counter_bloc/application/counter-cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: _CounterBloc(),
      ),
    );
  }
}

class _CounterBloc extends StatelessWidget {
  const _CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Bloc - Contador')),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterCubit>().incrementValue();
                },
                backgroundColor: Colors.blue[100],
                child: const Icon(Icons.add),
              ),
              SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterCubit>().decrementValue();
                },
                backgroundColor: Colors.blue[100],
                child: const Icon(Icons.remove),
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Contador'),
                Text(
                  state.value.toString(),
                  style: TextStyle(
                    color: state.value < 0
                        ? Colors.red
                        : state.value == 0
                        ? Colors.black
                        : Colors.green,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
