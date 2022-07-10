import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constant/error_message.dart';
import '../../../core/usecase/usecase.dart';
import '../../../domain/entity/qoute_entity.dart';
import '../../../domain/usecase/get_qoute.dart';

part 'get_qoute_state.dart';

class GetQouteCubit extends Cubit<GetQouteState> {
  final GetQoute _getQoute;
  GetQouteCubit(this._getQoute) : super(GetQouteInitial());

  void getQouteState() async {
    emit(QouteLoading());
    final eitherFailureOrQoute = await _getQoute.call(NoParams());
    eitherFailureOrQoute.fold(
        (l) => const QouteError(errorMessage), (r) => QouteLoaded(r));
  }
}
