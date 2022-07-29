// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qoute/qoute_app/domain/usecase/delete_favorite.dart';

import '../../../domain/entity/favorite_entity.dart';
import '../../../domain/usecase/add_favorite.dart';
import '../../../domain/usecase/fetch_favorite.dart';

part 'add_fav_state.dart';

class FavCubit extends Cubit<FavState> {
  final FetchFavorite _fetch;
  final AddFavorite _add;
  final DeleteFavorite _del;
  FavCubit(
    this._fetch,
    this._add,
    this._del,
  ) : super(FavInitial());

  void addFavorite(FavoriteEntity fav) async {
    await _add.call(fav);
  }

  void fetchFavorite() async {
    emit(FavLoading());

    final favs = await _fetch.call();
    if (favs.isEmpty) {
      emit(FavEmpty());
    } else {
      emit(FavLoaded(favorites: favs));
    }
  }

  void deleteFav(String qoutes) async {
    await _del(qoutes);
  }
}
