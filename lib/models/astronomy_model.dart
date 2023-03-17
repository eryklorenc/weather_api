class AstronomyModel {
  const AstronomyModel({
    required this.city,
    required this.sunrise,
    required this.moonrise,
  });
  final String city;
  final String sunrise;
  final String moonrise;

  AstronomyModel.fromJson(Map<String, dynamic> json)
      : city = json['location']['name'],
        sunrise = json['astronomy']['astro']['sunrise'],
        moonrise = json['astronomy']['astro']['moonrise'];
}
