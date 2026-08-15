import 'package:bloc_practice/E%20Ticaret%20Demo/model/item_model.dart';

class ItemData {
  final List<ItemModel> items = [
    ItemModel(
      itemName: "Galatasaray Ceketi",
      itemPrice: 1905,
      imagePath: "assets/images/gs_ceket.png",
    ),
    ItemModel(itemName: "Gucci Canta", itemPrice: 4400, imagePath: "assets/images/gucci_canta.png"),
    ItemModel(itemName: "iphone 15", itemPrice: 2400, imagePath: "assets/images/iphone_15.png"),
    ItemModel(itemName: "Kazak", itemPrice: 250, imagePath: "assets/images/kazak.png"),
    ItemModel(itemName: "MacBook Pro", itemPrice: 2200, imagePath: "assets/images/macbook_pro.png"),
    ItemModel(itemName: "Rolex Saat", itemPrice: 5000, imagePath: "assets/images/rolex_saat.png"),
    ItemModel(
      itemName: "Samsung Telefon",
      itemPrice: 2000,
      imagePath: "assets/images/samsung_telefon.png",
    ),
  ];
}
