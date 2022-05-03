class ProductModel {
  ProductModel({required this.id});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
    );
  }

  final String id;
}
