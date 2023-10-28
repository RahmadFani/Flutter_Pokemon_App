// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeEvent {}

class GettingListGeneration extends HomeEvent {}

class ChangeCurrentTabHome extends HomeEvent {
  final int value;

  ChangeCurrentTabHome({
    required this.value,
  });
}
