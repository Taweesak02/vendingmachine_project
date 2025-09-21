class Item {
  Item({
    required this.name,
    required this.price,
    required this.stockLeft,
    required this.image,
  });

  final String name;
  final double price;
  int stockLeft;
  final String image;

  void addsupply() {
    stockLeft = 10;
  }

  void decrease() {
    stockLeft -= 1;
  }
}

//ของที่มีในเครื่อง
Map<int, Item> itemsInVendingMachine = {
  1: Item(
    name: "เลย์",
    price: 20,
    stockLeft: 10,
    image: "assets/items/potato.jpg",
  ),
  2: Item(
    name: "ช็อกโกแลต hershey",
    price: 30,
    stockLeft: 10,
    image: "assets/items/chocolate.jpg",
  ),
  3: Item(
    name: "น้ำเปล่า",
    price: 7,
    stockLeft: 10,
    image: "assets/items/water.jpg",
  ),
  4: Item(
    name: "โคคาโคล่า",
    price: 10,
    stockLeft: 10,
    image: "assets/items/cola.jpg",
  ),
  5: Item(name: "ชา", price: 10, stockLeft: 10, image: "assets/items/tea.jpg"),
  6: Item(
    name: "นม",
    price: 13,
    stockLeft: 10,
    image: "assets/items/milk.jpg",
  ),
  7: Item(
    name: "สปอนเซอร์",
    price: 10,
    stockLeft: 10,
    image: "assets/items/energy.jpg",
  ),
  8: Item(
    name: "ขนมปังฟาร์มเฮาร์",
    price: 15,
    stockLeft: 10,
    image: "assets/items/bread.jpg",
  ),
  9: Item(
    name: "ลูกอม",
    price: 15,
    stockLeft: 10,
    image: "assets/items/candy.jpg",
  ),
  10: Item(
    name: "หมากฝรั่ง",
    price: 10,
    stockLeft: 10,
    image: "assets/items/gum.jpg",
  ),
};
