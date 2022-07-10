// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_fav_cubit.dart';

abstract class FavState extends Equatable {
  const FavState();

  @override
  List<Object> get props => [];
}

class FavInitial extends FavState {}

class FavLoading extends FavState {}

class FavLoaded extends FavState {
  final List<FavoriteEntity> favorites;
  const FavLoaded({
    required this.favorites,
  });
}

class FavEmpty extends FavState {}
