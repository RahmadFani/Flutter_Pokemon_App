// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorites_bloc.dart';

@JsonSerializable()
class FavoritesState extends Equatable {
  final List<Favorite> favorites;
  const FavoritesState({
    this.favorites = const [],
  });
  @override
  List<Object?> get props => [
        favorites,
      ];

  FavoritesState copyWith({
    List<Favorite>? favorites,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
    );
  }
}
