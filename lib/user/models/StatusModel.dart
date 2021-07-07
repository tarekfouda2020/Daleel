
class StatusModel {
  StatusModel({
    required this.text,
    required this.createdAt,
  });

  String text;
  DateTime createdAt;

  factory StatusModel.fromMap(Map<String, dynamic> json) => StatusModel(
    text: json["text"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toMap() => {
    "text": text,
    "created_at": createdAt.toIso8601String(),
  };
}