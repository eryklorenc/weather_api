import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/content/cubit/astronomy_cubit.dart';
import 'package:weather_api/models/astronomy_model.dart';

class Astronomy extends StatelessWidget {
  const Astronomy({
    super.key,
    required this.astronomyModel,
  });

  final AstronomyModel astronomyModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AstronomyCubit, AstronomyState>(
      builder: (context, state) {
        return Expanded(
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 140.0,
                    width: 90.0,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/moonrise.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        astronomyModel.moonrise,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Container(
                    height: 140.0,
                    width: 90.0,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/sunrise.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        astronomyModel.sunrise,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
