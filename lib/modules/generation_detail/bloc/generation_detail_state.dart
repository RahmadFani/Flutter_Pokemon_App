// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'generation_detail_bloc.dart';

@JsonSerializable()
class GenerationDetailState extends Equatable {
  final bool loading;
  final GenerationDetail? detail;
  const GenerationDetailState({
    this.loading = false,
    this.detail,
  });
  @override
  List<Object?> get props => [loading, detail];

  GenerationDetailState copyWith({
    bool? loading,
    GenerationDetail? detail,
  }) {
    return GenerationDetailState(
      loading: loading ?? this.loading,
      detail: detail ?? this.detail,
    );
  }
}
