import 'package:bloc_practice/counter/bloc/counter_bloc.dart';
import 'package:bloc_practice/counter/bloc/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return Column(
              children: [
                Text("$state"),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterIncremented());
                  },
                  child: Text("Artır"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecremented());
                  },
                  child: Text("Azalt"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
