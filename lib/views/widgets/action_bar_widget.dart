import 'package:flutter/material.dart';

class ActionBarWidget extends StatelessWidget {
  const ActionBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionButton(context, Icons.call, 'CALL'),
          _buildActionButton(context, Icons.route, 'ROUTE'),
          _buildActionButton(context, Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.deepPurple),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
              color: Colors.deepPurple, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}