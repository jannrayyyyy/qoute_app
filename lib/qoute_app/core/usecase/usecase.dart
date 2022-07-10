import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<ServerFailure, Type>> call(Params params);
}

class NoParams {}
