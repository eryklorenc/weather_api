class WeatherModel {
  const WeatherModel({
    required this.temperature,
    required this.city,
    required this.wind,
    required this.humidity,
    required this.feelslike,
    required this.pressure,
  });

  final double temperature;
  final String city;
  final double wind;
  final int humidity;
  final double feelslike;
  final double pressure;

  WeatherModel.fromJson(Map<String, dynamic> json)
      : temperature = json['current']['temp_c'] + 0.0,
        city = json['location']['name'],
        wind = json['current']['wind_mph'] + 0.0,
        humidity = json['current']['humidity'],
        feelslike = json['current']['feelslike_c'] + 0.0,
        pressure = json['current']['pressure_in'] + 0.0;
}
