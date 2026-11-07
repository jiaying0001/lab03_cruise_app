import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination destination = CruiseDestination(
    name: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    description: 'Experience the heart of Sibu along Malaysia\'s longest river, the Rajang. Cruise past historic temples, timber hubs, and traditional waterfront settlements while experiencing authentic Sarawakian hospitality.',
    imageLabel: 'Sibu Esplanade Landmark',
  );

  int _starCount = 43;
  DateTime _selectedDate = DateTime.now();
  String _selectedMode = 'Private River Cruise';
  bool _isDarkMode = false;

  int get starCount => _starCount;
  DateTime get selectedDate => _selectedDate;
  String get selectedMode => _selectedMode;
  bool get isDarkMode => _isDarkMode;

  void incrementStar() {
    _starCount++;
    notifyListeners();
  }

  void updateDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  void updateMode(String newMode) {
    _selectedMode = newMode;
    notifyListeners();
  }

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}