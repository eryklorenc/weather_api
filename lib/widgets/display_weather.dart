import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/home/cubit/home_cubit.dart';
import 'package:weather_api/models/weather_model.dart';

class DisplayWeather extends StatelessWidget {
  const DisplayWeather({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
              weatherModel.temperature.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 60),
            Text(
              weatherModel.city,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 60),
          ],
        );
      },
    );
  }
}
