
import 'package:weather_api/data/remote_data_sources/astronomy_remote_data_source.dart';
import 'package:weather_api/models/astronomy_model.dart';

class AstronomyRepository {
  AstronomyRepository(this._astronomyRemoteDataSource);

  final AstronomyRemoteDataSource _astronomyRemoteDataSource;

  Future<AstronomyModel?> getAstronomyModel({
    required String city,
  }) async {
    final json = await _astronomyRemoteDataSource.getAstronomyData(
      city: city,
    );

    if (json == null) {
      return null;
    }

    return AstronomyModel.fromJson(json);
  }
}
