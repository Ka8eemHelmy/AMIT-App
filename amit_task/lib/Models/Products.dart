class Product {
  int id;
  String name;
  String? title='';
  int categoryID;
  String? description;
  num price;
  num discount;
  String? discountType;
  String currency;
  int inStock;
  String avatar;
  num priceFinal;
  String priceFinalText;

  Product({
    required this.id,
    required this.name,
    required this.title,
    required this.categoryID,
    required this.description,
    required this.price,
    required this.discount,
    required this.discountType,
    required this.currency,
    required this.inStock,
    required this.avatar,
    required this.priceFinal,
    required this.priceFinalText,
  });

  factory Product.fromJson(Map json) {
    return Product(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      categoryID: json['category_id'],
      description: json['description'],
      price: json['price'],
      discount: json['discount'],
      discountType: json['discount_type'],
      currency: json['currency'],
      inStock: json['in_stock'],
      avatar: json['avatar'],
      priceFinal: json['price_final'],
      priceFinalText: json['price_final_text'],
    );
  }
}
