import 'package:bloc_practice/E%20Ticaret%20Demo/model/item_model.dart';

class ItemState {
  ItemStatus itemStatus;
  List<ItemModel> items; // Sepet e birden fazla item ekleyeceğimiz için bu yapıyı kurduk
  ItemState({required this.itemStatus, required this.items});
}

enum ItemStatus { initial, add, out }
