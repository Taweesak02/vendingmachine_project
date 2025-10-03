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

//สินค้าที่มีในเครื่องทั้งหมด
Map<int, Item> itemsInVendingMachine = {
  1: Item(
    name: "เลย์ มันฝรั่งทอดกรอบแผ่นเรียบ รสมันฝรั่งแท้",
    price: 20,
    stockLeft: 10,
    image: "assets/items/potato.jpg",
  ),
  2: Item(
    name: "เฮอร์ชี่ส์ ช็อคโกแลต คุกกี้แอนด์ครีม",
    price: 30,
    stockLeft: 10,
    image: "assets/items/chocolate.jpg",
  ),
  3: Item(
    name: "น้ำทิพย์ น้ำดื่ม",
    price: 14,
    stockLeft: 10,
    image: "assets/items/water.jpg",
  ),
  4: Item(
    name: "โค้ก น้ำอัดลม",
    price: 10,
    stockLeft: 10,
    image: "assets/items/cola.jpg",
  ),
  5: Item(
    name: "อิชิตัน ชาเขียว รสน้ำผึ้งผสมมะนาว",
    price: 25,
    stockLeft: 10,
    image: "assets/items/tea.jpg"
  ),
  6: Item(
    name: "เมจิ นมพาสเจอร์ไรส์ รสช็อกโกแลต",
    price: 13,
    stockLeft: 10,
    image: "assets/items/milk.jpg",
  ),
  7: Item(
    name: "สปอนเซอร์ ออริจินัล",
    price: 14,
    stockLeft: 10,
    image: "assets/items/energy.jpg",
  ),
  8: Item(
    name: "ฟาร์มเฮ้าส์ ขนมปังหน้าเนยสด",
    price: 9,
    stockLeft: 10,
    image: "assets/items/bread.jpg",
  ),
  9: Item(
    name: "ทอมมี่ ลูกอมเคี้ยวหนึบกลิ่นผลไม้",
    price: 5,
    stockLeft: 10,
    image: "assets/items/candy.jpg",
  ),
  10: Item(
    name: "ริกลี่ย์ ดับเบิ้ลมินต์ หมากฝรั่งรสมิ้นต์ สติ๊ก",
    price: 7,
    stockLeft: 10,
    image: "assets/items/gum.jpg",
  ),
};
