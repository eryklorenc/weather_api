import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/home/cubit/home_cubit.dart';
import 'package:weather_api/models/weather_model.dart';

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  final TextStyle titleFont =
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 18);

  final TextStyle infoFont =
      const TextStyle(fontWeight: FontWeight.w300, fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Wind',
                            style: titleFont,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(Icons.wind_power_outlined),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Pressure',
                            style: titleFont,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(Icons.lock_clock),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${weatherModel.wind} km/h',
                        style: infoFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${weatherModel.pressure} in',
                        style: infoFont,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Humidity',
                            style: titleFont,
                          ),
                          const Icon(Icons.water_drop),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Feels Like',
                            style: titleFont,
                          ),
                          const Icon(Icons.device_thermostat),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${weatherModel.humidity}%',
                        style: infoFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${weatherModel.feelslike}°C',
                        style: infoFont,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
