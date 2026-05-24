enum ItemType {
  fruit,
  vegetable,
}

class Item {
  String name;
  String image;
  double price;
  ItemType type;
  int quantity;
  Item({required this.name, required this.image, required this.price, required this.type, this.quantity = 0});
}
