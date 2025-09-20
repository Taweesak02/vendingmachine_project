class Item {
  const Item({
    required this.name,
    required this.price,
    required this.stockLeft,
    required this.image,
  });

  final String name;
  final double price;
  final int stockLeft;
  final String image;
}

//ของที่มีในเครื่อง
Map<int, Item> itemsInVendingMachine = {
  1: Item(name: "Potato Chip", price: 20, stockLeft: 0,image:"assets/items/potato.jpg"),
  2: Item(name: "Chocolate Bar", price: 30, stockLeft: 10,image: "assets/items/chocolate.jpg"),
  3: Item(name: "Water", price: 7, stockLeft: 10,image: "assets/items/water.jpg"),
  4: Item(name: "Soda", price: 10, stockLeft: 10,image: "assets/items/cola.jpg"),
  5: Item(name: "Tea", price: 10, stockLeft: 10,image: "assets/items/tea.jpg"),
  6: Item(name: "Milk", price: 13, stockLeft: 10,image: "assets/items/milk.jpg"),
  7: Item(name: "Energy Drink", price: 10, stockLeft: 10,image: "assets/items/energy.jpg"),
  8: Item(name: "bread", price: 15, stockLeft: 10,image: "assets/items/bread.jpg"),
  9: Item(name: "Candy", price: 15, stockLeft: 10,image: "assets/items/candy.jpg"),
  10: Item(name: "Gum", price: 10, stockLeft: 10,image: "assets/items/gum.jpg"),
};
