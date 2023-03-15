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
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.sunny,
                color: Colors.black,
                size: 90,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                weatherModel.temperature.toString(),
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 10),
              Text(
                weatherModel.city,
                style: const TextStyle(
                  fontSize: 17,
                  color: Color(0xFF5a5a5a),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        );
      },
    );
  }
}
