class Item {
  final String name;
  final double price;
  final String image;
  final List<int> size;

  Item(
      {required this.name,
      required this.price,
      required this.image,
      required this.size});
}

List<Item> items = [
  Item(
    name: "Men's Nike Shoes",
    price: 44.5,
    image: "assets/images/shoes1.png",
    size: [9, 10, 11, 12],
  ),
  Item(
    name: "Men's Nike Shoes2",
    price: 35,
    image: "assets/images/shoes2.png",
    size: [9, 10, 11, 12],
  ),
  Item(
    name: "Men's Nike Shoes3",
    price: 40,
    image: "assets/images/shoes1.png",
    size: [9, 10, 11, 12],
  ),
  Item(
    name: "Men's Nike Shoes4",
    price: 35,
    image: "assets/images/shoes2.png",
    size: [9, 10, 11, 12],
  ),
  Item(
    name: "Men's Nike Shoes",
    price: 50,
    image: "assets/images/shoes1.png",
    size: [9, 10, 11, 12],
  ),
];
