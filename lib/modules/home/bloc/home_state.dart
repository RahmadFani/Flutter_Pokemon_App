// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@JsonSerializable()
class HomeState extends Equatable {
  /// loading list generation
  final bool loading;

  final List<Generation> generations;

  /// currentTab [0|Explore] [1|Pavorite]
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int currentTab;

  const HomeState({
    this.currentTab = 0,
    this.loading = true,
    this.generations = const [],
  });

  @override
  List<Object?> get props => [
        currentTab,
        loading,
        generations,
      ];

  HomeState copyWith({
    bool? loading,
    List<Generation>? generations,
    int? currentTab,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      generations: generations ?? this.generations,
      currentTab: currentTab ?? this.currentTab,
    );
  }
}
