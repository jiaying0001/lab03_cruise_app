import 'package:flutter/material.dart';
import '../../models/cruise_destination.dart';

class HeaderImageWidget extends StatelessWidget {
  final CruiseDestination destination;
  const HeaderImageWidget({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/river.jpeg',
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Container(
            color: Colors.black54,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              destination.imageLabel,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}