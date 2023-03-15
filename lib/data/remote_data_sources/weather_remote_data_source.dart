import 'package:dio/dio.dart';

class WeatherRemoteDataSource {
  Future<Map<String,dynamic>?> getWeatherData({
    required String city,
  }) async {
    final response = await Dio().get<Map<String, dynamic>>(
        'http://api.weatherapi.com/v1/current.json?key=33eabb059fbd42dd93e190429230903&q=$city&aqi=no');
    return  response.data;

  }
}
