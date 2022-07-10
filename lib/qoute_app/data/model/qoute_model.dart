import '../../domain/entity/qoute_entity.dart';

class QouteModel extends QouteEntity {
  const QouteModel({
    required String text,
    required String author,
  }) : super(text: text, author: author);

  factory QouteModel.fromJson(Map<String, dynamic> json) => QouteModel(
        text: json["text"] ?? '',
        author: json["author"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "author": author,
      };
}
