import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/home/cubit/home_cubit.dart';
import 'package:weather_api/models/weather_model.dart';

class AdditionalInformation extends StatelessWidget {
  AdditionalInformation({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  TextStyle titleFont =
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 18);

  TextStyle infoFont =
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
                      Text(
                        'Wind',
                        style: titleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Pressure',
                        style: titleFont,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weatherModel.wind.toString(),
                        style: infoFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        weatherModel.pressure.toString(),
                        style: infoFont,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Humidity',
                        style: titleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Feels Like',
                        style: titleFont,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weatherModel.humidity.toString(),
                        style: infoFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        weatherModel.feelslike.toString(),
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
