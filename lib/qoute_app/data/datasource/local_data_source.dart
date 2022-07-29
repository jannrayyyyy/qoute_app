import 'package:hive/hive.dart';

import '../model/favorite_model.dart';

abstract class LocalDataSource {
  Future<void> addFavorite(FavoriteModel fav);
  Future<List<FavoriteModel>> fetchFav();
  Future<void> deleteQoute(String qoute);
}

class LocalDataSourceImpl implements LocalDataSource {
  final favoriteBox = Hive.box('favorite');
  @override
  Future<void> addFavorite(FavoriteModel fav) async {
    await favoriteBox.put(fav.text, fav);
  }

  @override
  Future<List<FavoriteModel>> fetchFav() async {
    var cachedFavorite = favoriteBox.values.toList();
    final convertedTable = cachedFavorite.map((table) {
      return table as FavoriteModel;
    }).toList();
    return convertedTable;
  }

  @override
  Future<void> deleteQoute(String qoute) async {
    await favoriteBox.delete(qoute);
  }
}
