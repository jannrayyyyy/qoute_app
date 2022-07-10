import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../entity/qoute_entity.dart';
import '../repository/qoute_repository.dart';

class GetQoute implements UseCase<List<QouteEntity>, NoParams> {
  final QouteRepository repo;

  GetQoute(this.repo);
  @override
  Future<Either<ServerFailure, List<QouteEntity>>> call(NoParams params) {
    return repo.getQoute();
  }
}
