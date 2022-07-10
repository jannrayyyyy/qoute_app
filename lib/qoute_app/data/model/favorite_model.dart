// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entity/favorite_entity.dart';

part 'favorite_model.g.dart';

@HiveType(typeId: 0)
class FavoriteModel extends FavoriteEntity {
  @override
  @HiveField(0)
  // ignore: prefer_typing_uninitialized_variables
  final String text;
  @override
  @HiveField(1)
  final String author;
  FavoriteModel({
    required this.text,
    required this.author,
  }) : super(
          text: text,
          author: author,
        );
  factory FavoriteModel.fromMap(Map<String, dynamic> map) => FavoriteModel(
        text: map['text'],
        author: map['author'],
      );

  Map<String, dynamic> toMap() => {
        'text': text,
        'author': author,
      };
  factory FavoriteModel.fromEntity(FavoriteEntity entity) => FavoriteModel(
        text: entity.text,
        author: entity.author,
      );
}
