import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_names/application/random-bloc/random_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Names'), centerTitle: true),
      body: _HomeControllerScreen(),
    );
  }
}

class _HomeControllerScreen extends StatelessWidget {
  const _HomeControllerScreen();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<RandomBloc, RandomState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Text('Nombre: ${state.name}', style: TextStyle(fontSize: 24)),
              SizedBox(height: 20),
              TextButton(
                onPressed: () =>
                    context.read<RandomBloc>().add(ChangeCounterValueEvent()),
                child: Text(
                  '+${state.counterValue}',
                  style: TextStyle(
                    fontSize: 42,
                    color: state.counterValue > 10 ? Colors.red : Colors.black,
                  ),
                ),
              ),

              const Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[300],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () =>
                      context.read<RandomBloc>().add(GenerateRandomNameEvent()),
                  child: Text('Nombre aleatorio'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
