import 'package:equatable/equatable.dart';

class QouteEntity extends Equatable {
  final String text;
  final String author;

  const QouteEntity({required this.text, required this.author});
  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
