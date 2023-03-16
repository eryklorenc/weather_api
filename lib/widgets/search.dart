import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/home/cubit/home_cubit.dart';

class Search extends StatelessWidget {
  Search({
    Key? key,
  }) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: const Text('City'),
                      hintText: 'London',
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<HomeCubit>()
                        .getWeatherModel(city: _controller.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text('Get'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
