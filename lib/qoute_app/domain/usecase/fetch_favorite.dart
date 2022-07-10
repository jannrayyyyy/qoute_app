// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../entity/favorite_entity.dart';
import '../repository/qoute_repository.dart';

class FetchFavorite {
  final QouteRepository repo;
  FetchFavorite({
    required this.repo,
  });

  Future<List<FavoriteEntity>> call() async {
    return await repo.fetchFav();
  }
}
