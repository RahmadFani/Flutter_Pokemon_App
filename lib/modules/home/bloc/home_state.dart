// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@JsonSerializable()
class HomeState extends Equatable {
  /// loading list generation
  final bool loading;

  /// currentTab [0|Explore] [1|Pavorite]
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int currentTab;

  const HomeState({
    this.currentTab = 0,
    this.loading = true,
  });

  @override
  List<Object?> get props => [
        currentTab,
        loading,
      ];
}
