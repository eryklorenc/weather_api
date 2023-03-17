import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_api/app/core/enums.dart';
import 'package:weather_api/models/astronomy_model.dart';
import 'package:weather_api/repositories/astronomy_repository.dart';

part 'astronomy_state.dart';

class AstronomyCubit extends Cubit<AstronomyState> {
  AstronomyCubit(this._astronomyRepository) : super(const AstronomyState());

  final AstronomyRepository _astronomyRepository;

  Future<void> getAstronomyModel({
    required String city,
  }) async {
    emit(const AstronomyState(status: Status.loading));
    try {
      final astronomyModel = await _astronomyRepository.getAstronomyModel(city: city);
      emit(
        AstronomyState(
          model: astronomyModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        AstronomyState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
