import 'package:bloc_practice/E%20Ticaret%20Demo/cubit/item_cubit.dart';
import 'package:bloc_practice/E%20Ticaret%20Demo/cubit/item_state.dart';
import 'package:bloc_practice/E%20Ticaret%20Demo/data/item_data.dart';
import 'package:bloc_practice/E%20Ticaret%20Demo/view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsView extends StatefulWidget {
  const ItemsView({super.key});

  @override
  State<ItemsView> createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  final ItemData _items = ItemData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartView()));
        },
        icon: Icon(Icons.shopping_bag),
      ),
      appBar: AppBar(),
      body: BlocConsumer<ItemCubit, ItemState>(
        listener: (context, state) {
          if (state.itemStatus == ItemStatus.add) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Ürün sepete eklendi")));
          }
        },
        builder: (context, state) {
          return ListView.builder(
            itemCount: _items.items.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Image.asset(_items.items[index].imagePath),
                  title: Text(_items.items[index].itemName),
                  subtitle: Text("${_items.items[index].itemPrice}"),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<ItemCubit>().addItems(
                        itemName: _items.items[index].itemName,
                        itemPrice: _items.items[index].itemPrice,
                        imagePath: _items.items[index].imagePath,
                      );
                    },
                    icon: Icon(Icons.add),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
