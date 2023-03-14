import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/app/core/enums.dart';
import 'package:weather_api/home/cubit/home_cubit.dart';
import 'package:weather_api/repositories/weather_repository.dart';
import 'package:weather_api/widgets/display_weather.dart';
import 'package:weather_api/widgets/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        WeatherRepository(),
      ),
      child: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unkown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final weatherModel = state.model;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Temperature'),
              ),
              body: Center(
                child: Builder(builder: (context) {
                  if (state.status == Status.loading) {
                    return const Text('Loading');
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (weatherModel != null)
                        DisplayWeather(
                          weatherModel: weatherModel,
                        ),
                      const SizedBox(
                        height: 150,
                      ),
                      Search(),
                    ],
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}
