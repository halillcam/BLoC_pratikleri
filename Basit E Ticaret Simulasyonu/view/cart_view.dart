import 'package:bloc_practice/E%20Ticaret%20Demo/cubit/item_cubit.dart';
import 'package:bloc_practice/E%20Ticaret%20Demo/cubit/item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sepet")),
      body: BlocConsumer<ItemCubit, ItemState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              final item = state.items[index];

              return Card(
                child: ListTile(
                  title: Text(item.itemName),
                  subtitle: Text(item.itemPrice.toString()),
                  leading: Image.asset(item.imagePath),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<ItemCubit>().deleteItem(itemName: item.itemName);
                    },
                    icon: Icon(Icons.remove),
                  ),
                ),
              );
            },
          );
        },
        listener: (BuildContext context, ItemState state) {
          if (state.itemStatus == ItemStatus.out) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Ürün Sepetten Çıkarıldı")));
          }
        },
      ),
    );
  }
}
