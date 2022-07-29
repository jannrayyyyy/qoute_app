import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constant/error_message.dart';
import '../../../core/usecase/usecase.dart';
import '../../../domain/entity/qoute_entity.dart';
import '../../../domain/usecase/get_qoute.dart';

part 'qoute_state.dart';

class QouteCubit extends Cubit<QouteState> {
  final GetQoute _getQoute;

  QouteCubit(this._getQoute) : super(QouteInitial());

  void getQouteState() async {
    emit(QouteLoading());
    final eitherFailureOrQoute = await _getQoute.call(NoParams());
    eitherFailureOrQoute.fold((l) => emit(const QouteError(msg: errorMessage)),
        (r) => emit(QouteLoaded(qoutes: r)));
  }
}
