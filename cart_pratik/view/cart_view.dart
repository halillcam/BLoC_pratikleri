import 'package:bloc_ogreniyorum/add%20cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<CartCubit, int>(
            builder: (context, state) {
              return Row(
                children: [Icon(Icons.shopping_cart), SizedBox(width: 10), Text("($state)")],
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              child: SizedBox(
                height: 150,
                width: 150,
                child: Center(
                  child: Image.network(
                    "https://unsplash.com/photos/a-person-holding-a-cell-phone-in-their-hand-tINA7aUB49g",
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 150,
              height: 100,
              child: Center(
                child: Column(
                  children: [
                    Text("Sepete Ekle/Çıkar"),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.read<CartCubit>().increment();
                          },
                          child: Icon(Icons.add),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.read<CartCubit>().decrement();
                          },
                          child: Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
