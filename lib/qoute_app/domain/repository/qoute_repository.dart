import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entity/favorite_entity.dart';
import '../entity/qoute_entity.dart';

abstract class QouteRepository {
  Future<Either<ServerFailure, List<QouteEntity>>> getQoute();

  Future<void> addFavorite(FavoriteEntity fav);
  Future<List<FavoriteEntity>> fetchFav();
}
