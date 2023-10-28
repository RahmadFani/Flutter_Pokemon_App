// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'generation_detail_bloc.dart';

@JsonSerializable()
class GenerationDetailState extends Equatable {
  final bool loading;
  final GenerationDetail? detail;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String errorMessage;
  const GenerationDetailState({
    this.loading = false,
    this.detail,
    this.errorMessage = '',
  });
  @override
  List<Object?> get props => [
        loading,
        detail,
        errorMessage,
      ];

  GenerationDetailState copyWith({
    bool? loading,
    GenerationDetail? detail,
    String? errorMessage,
  }) {
    return GenerationDetailState(
      loading: loading ?? this.loading,
      detail: detail ?? this.detail,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
