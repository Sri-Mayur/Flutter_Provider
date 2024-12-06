import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _darkTheme = false; // Private variable to track theme state

  bool get darkTheme => _darkTheme; // Getter to expose the current theme state

  // Method to toggle the theme
  void updateTheme(bool isDark) {
    _darkTheme = isDark;
    notifyListeners(); // Notify listeners about the state change
  }
}
