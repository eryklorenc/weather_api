import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/app/core/enums.dart';
import 'package:weather_api/models/weather_model.dart';
import 'package:weather_api/repositories/weather_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._weatherRepository) : super(const HomeState());

  final WeatherRepository _weatherRepository;

  Future<void> getWeatherModel({
    required String city,
  }) async {
    emit(const HomeState(status: Status.loading));
    try {
      final weatherModel = await _weatherRepository.getWeatherModel(city: city);
      emit(
        HomeState(
          model: weatherModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        HomeState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}