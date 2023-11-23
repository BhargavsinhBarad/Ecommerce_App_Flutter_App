class api_model {
  int id;
  String title;
  String description;
  var price;
  var discountPercentage;
  var rating;
  var stock;
  String brand;
  String category;
  String thumbnail;
  List images;

  api_model(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.discountPercentage,
      required this.rating,
      required this.stock,
      required this.brand,
      required this.category,
      required this.thumbnail,
      required this.images});
  factory api_model.js({required Map data}) {
    return api_model(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        price: data['price'],
        discountPercentage: data['discountPercentage'],
        rating: data['rating'],
        stock: data['stock'],
        brand: data['brand'],
        category: data['category'],
        thumbnail: data['thumbnail'],
        images: data['images']);
  }
}
