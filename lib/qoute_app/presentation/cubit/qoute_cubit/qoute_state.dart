part of 'qoute_cubit.dart';

abstract class QouteState extends Equatable {
  const QouteState();

  @override
  List<Object> get props => [];
}

class QouteInitial extends QouteState {}

class QouteLoading extends QouteState {}

class QouteLoaded extends QouteState {
  final List<QouteEntity> qoutes;
  const QouteLoaded({required this.qoutes});
}

class QouteError extends QouteState {
  final String msg;

  const QouteError({required this.msg});
}
