// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorites_bloc.dart';

class FavoritesEvent {}

class SetFavorite extends FavoritesEvent {
  final Favorite favorite;
  SetFavorite({
    required this.favorite,
  });
}
