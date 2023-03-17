part of 'astronomy_cubit.dart';

class AstronomyState {
  const AstronomyState({
    this.model,
    this.status = Status.initial,
    this.errorMessage,
  });
  final AstronomyModel? model;
  final Status status;
  final String? errorMessage;
}
