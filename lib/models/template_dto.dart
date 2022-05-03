class TemplateDto {
  TemplateDto({required this.id});

  factory TemplateDto.fromJson(Map<String, dynamic> json) {
    return TemplateDto(
      id: json['id'] as String,
    );
  }

  Map toJson() => {
        'id': id,
      };

  final String id;
}
