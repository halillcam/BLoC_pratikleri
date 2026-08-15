import 'package:bloc_practice/E%20Ticaret%20Demo/cubit/item_state.dart';

import 'package:bloc_practice/E%20Ticaret%20Demo/model/item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemState(itemStatus: ItemStatus.initial, items: []));

  // add Items

  void addItems({required String itemName, required int itemPrice, required String imagePath}) {
    final itemModel = ItemModel(itemName: itemName, itemPrice: itemPrice, imagePath: imagePath);

    // Eski ürünleri koru + yeni ürünü ekle
    final newItems = [...state.items, itemModel];

    emit(ItemState(itemStatus: ItemStatus.add, items: newItems));
  }

  // delete Items

  void deleteItem({required String itemName}) {
    // eğer seçilen item listede varsa onu tut diğerlerini başka listeye ekle olarak yapıyoruz işlemi
    final newItems = state.items.where((item) => item.itemName != itemName).toList();

    emit(ItemState(itemStatus: ItemStatus.out, items: newItems));
  }
}
