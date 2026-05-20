import 'package:bloc_ogreniyorum/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Sayaç Pratiği '), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Mevcut Sayı:', style: TextStyle(fontSize: 20, color: Colors.grey)),

            const SizedBox(height: 10),

            //  BLOCBUILDER: Sayı her değiştiğinde sadece bu Text widget'ını yeniden çizer.
            // <CounterCubit, int> diyerek hangi kutuyu dinlediğimizi ve bize 'int' geleceğini belirttik.
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            // context.read ile CounterCubit'e ulaşıp artir() fonksiyonunu tetikliyoruz.
            onPressed: () => context.read<CounterCubit>().artir(),
            child: const Icon(Icons.add),
          ),

          const SizedBox(height: 10),

          // Azaltma Butonu
          FloatingActionButton(
            // context.read ile CounterCubit'e ulaşıp azalt() fonksiyonunu tetikliyoruz.
            onPressed: () => context.read<CounterCubit>().azalt(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
