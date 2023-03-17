import 'package:flutter/material.dart';

class Astronomy extends StatelessWidget {
  const Astronomy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
          child: const Center(
            child: Text(
              '12.00 PM',
              style: TextStyle(color: Colors.white, fontSize: 20),
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
          child: const Center(
            child: Text(
              '12.00 PM',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
