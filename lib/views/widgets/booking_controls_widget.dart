import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';
import 'package:intl/intl.dart';

class BookingControlsWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;
  const BookingControlsWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Trip Preferences', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Cruise Date:'),
                TextButton(
                  onPressed: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: viewModel.selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) {
                      viewModel.updateDate(picked);
                    }
                  },
                  child: Text(
                    DateFormat('dd/MM/yyyy').format(viewModel.selectedDate),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Transport Mode:'),
                DropdownButton<String>(
                  value: viewModel.selectedMode,
                  underline: const SizedBox(),
                  items: ['Express Boat', 'Private Cruise', 'Sunset Cruise']
                      .map((String mode) {
                    return DropdownMenuItem<String>(
                      value: mode,
                      child: Text(mode, style: const TextStyle(fontSize: 14)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) viewModel.updateMode(newValue);
                  },
                ),
              ],
            ),
            const Divider(),

            SwitchListTile(
              title: const Text('Dark Mode', style: TextStyle(fontSize: 14)),
              contentPadding: EdgeInsets.zero,
              value: viewModel.isDarkMode,
              onChanged: (bool value) {
                viewModel.toggleTheme(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}