// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../domain/entity/favorite_entity.dart';
import '../../domain/entity/qoute_entity.dart';
import '../../domain/repository/qoute_repository.dart';
import '../datasource/local_data_source.dart';
import '../datasource/remote_datasource.dart';
import '../model/favorite_model.dart';

class QouteRepositoryImplementation implements QouteRepository {
  final RemoteDataSource remote;
  final LocalDataSource local;
  QouteRepositoryImplementation(
    this.remote,
    this.local,
  );
  @override
  Future<Either<ServerFailure, List<QouteEntity>>> getQoute() async {
    try {
      final qoutes = await remote.fetchQoute();
      return Right(qoutes);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<void> addFavorite(FavoriteEntity fav) async {
    await local.addFavorite(FavoriteModel.fromEntity(fav));
  }

  @override
  Future<List<FavoriteEntity>> fetchFav() async {
    try {
      final result = await local.fetchFav();
      return result;
    } on CatchedException catch (e) {
      print(e);
      throw CatchedFailure();
    }
  }
}
