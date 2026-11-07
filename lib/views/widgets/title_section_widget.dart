import 'package:flutter/material.dart';
import '../../models/cruise_destination.dart';

class TitleSectionWidget extends StatelessWidget {
  final CruiseDestination destination;
  final int starCount;
  final VoidCallback onStarClicked;

  const TitleSectionWidget({
    super.key,
    required this.destination,
    required this.starCount,
    required this.onStarClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination.name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  destination.location,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onStarClicked,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    '$starCount',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}