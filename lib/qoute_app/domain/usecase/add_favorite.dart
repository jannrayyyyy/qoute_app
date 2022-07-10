// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../entity/favorite_entity.dart';
import '../repository/qoute_repository.dart';

class AddFavorite {
  final QouteRepository repo;
  AddFavorite({
    required this.repo,
  });

  Future<void> call(FavoriteEntity fav) async {
    await repo.addFavorite(fav);
  }
}
