import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'generation_detail_state.dart';
part 'generation_detail_event.dart';

class GenerationDetailBloc
    extends HydratedBloc<GenerationDetailEvent, GenerationDetailState> {
  final String name;
  final String url;

  GenerationDetailBloc({
    required this.name,
    required this.url,
  }) : super(GenerationDetailState()) {
    // * DO EVENT HERE
  }

  @override
  GenerationDetailState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(GenerationDetailState state) {
    return null;
  }

  @override
  String get id => url;
}
