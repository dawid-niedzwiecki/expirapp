class ProductDto {
  ProductDto({required this.id});

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      id: json['id'] as String,
    );
  }

  Map toJson() => {
        'id': id,
      };

  final String id;
}
