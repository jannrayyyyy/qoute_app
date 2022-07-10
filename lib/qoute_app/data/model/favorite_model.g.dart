// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteModelAdapter extends TypeAdapter<FavoriteModel> {
  @override
  final int typeId = 0;

  @override
  FavoriteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteModel(
      text: fields[0] as String,
      author: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.author);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
