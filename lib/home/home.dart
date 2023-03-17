import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/app/core/enums.dart';
import 'package:weather_api/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:weather_api/home/cubit/home_cubit.dart';
import 'package:weather_api/repositories/weather_repository.dart';
import 'package:weather_api/widgets/additional_information.dart';
import 'package:weather_api/widgets/astronomy.dart';
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
        WeatherRepository(
          WeatherRemoteDataSource(),
        ),
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
              backgroundColor: const Color(0xFFf9f9f9),
              appBar: AppBar(
                backgroundColor: const Color(0xFFf9f9f9),
                elevation: 0.3,
                title: const Text(
                  'Weather App',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {},
                  color: Colors.black,
                ),
              ),
              body: Center(
                child: Builder(builder: (context) {
                  if (state.status == Status.loading) {
                    return const Text('Loading');
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (weatherModel != null)
                        DisplayWeather(
                          weatherModel: weatherModel,
                        ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (weatherModel != null)
                        const Text(
                          'Additional Information',
                          style: TextStyle(
                              fontSize: 24,
                              color: Color(0xdd212121),
                              fontWeight: FontWeight.bold),
                        ),
                      if (weatherModel != null)
                        AdditionalInformation(
                          weatherModel: weatherModel,
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.mode_night_outlined),
                          Text(
                            'Astronomy',
                            style: TextStyle(
                                fontSize: 24,
                                color: Color(0xdd212121),
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.wb_sunny_outlined)
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Astronomy(),
                      const SizedBox(
                        height: 20,
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
