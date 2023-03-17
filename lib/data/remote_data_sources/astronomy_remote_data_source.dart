

import 'package:dio/dio.dart';

class AstronomyRemoteDataSource {
  Future<Map<String, dynamic>?> getAstronomyData({
    required String city,
  }) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'http://api.weatherapi.com/v1/astronomy.json?key=33eabb059fbd42dd93e190429230903&q=$city&dt=2023-03-17');
      return response.data;
    } on DioError catch (error) {
      throw Exception(
          error.response?.data['error']['message'] ?? 'Unknown error');
    }
  }
}