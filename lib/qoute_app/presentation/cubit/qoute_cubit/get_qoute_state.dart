part of 'get_qoute_cubit.dart';

abstract class GetQouteState extends Equatable {
  const GetQouteState();

  @override
  List<Object> get props => [];
}

class GetQouteInitial extends GetQouteState {}

class QouteLoaded extends GetQouteState {
  final List<QouteEntity> qoutes;
  const QouteLoaded(this.qoutes);
}

class QouteLoading extends GetQouteState {}

class QouteError extends GetQouteState {
  final String msg;

  const QouteError(this.msg);
}
