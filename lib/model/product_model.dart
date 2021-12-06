class ProductModel {
  final String id;
  final String name;
  final String description;
  final String category;
  final String image;
  final double price;
  final int wishlists;
  final double rate;
  final List<int> sizes;
  // final List<ReviewModel> reviews;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.image,
    required this.price,
    required this.wishlists,
    required this.sizes,
    // required this.reviews,
    required this.rate,
  });
  // : rate = reviews.map((rev) => rev.rate).average;

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    print(data["sizes"]);
    return ProductModel(
      id: data["id"],
      name: data["name"],
      description: data["description"],
      category: data["category"],
      image: data["image"],
      price: data["price"],
      wishlists: data["wishlists"],
      sizes: data["sizes"],
      // reviews: data["reviews"],
      // rate: data["reviews"].map((rev) => rev.rate).average,
      rate: data["rate"],
    );
  }
}
