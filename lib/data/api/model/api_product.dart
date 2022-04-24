class ApiProduct {
  final int id;
  final String title;
  final String description;
  final int price;
  final String image;

  ApiProduct.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        description = map['description'] ?? "",
        price = map['price'],
        image = map['image'];

  @override
  String toString() {
    return 'ApiProduct{id: $id, title: $title, description: $description, price: $price, image: $image}';
  }
}
