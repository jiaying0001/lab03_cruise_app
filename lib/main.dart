import 'package:flutter/material.dart';
import 'viewmodels/cruise_booking_viewmodel.dart';
import 'views/cruise_booking_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CruiseBookingViewModel _viewModel = CruiseBookingViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rajang River Cruise',
          theme: _viewModel.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: CruiseBookingScreen(viewModel: _viewModel),
        );
      },
    );
  }
}