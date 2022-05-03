class MessageDto {
  MessageDto({required this.id});

  factory MessageDto.fromJson(Map<String, dynamic> json) {
    return MessageDto(
      id: json['id'] as String,
    );
  }

  Map toJson() => {
        'id': id,
      };

  final String id;
}
