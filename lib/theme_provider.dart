import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = ThemeData.light();
  TextStyle _fontStyle = GoogleFonts.roboto();

  ThemeData get themeData => _themeData;
  TextStyle get fontStyle => _fontStyle;

  final List<ThemeData> _themes = [
    ThemeData.light(),
    ThemeData.dark(),
    ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color.fromRGBO(9, 115, 81, 1),
        iconTheme: IconThemeData(color: Color.fromRGBO(245, 156, 64, 1)),
        titleTextStyle: TextStyle(
          color: Color.fromRGBO(245, 156, 64, 1),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      scaffoldBackgroundColor: const Color.fromRGBO(245, 156, 64, 1),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color.fromRGBO(9, 115, 81, 1)),
        bodyMedium: TextStyle(color: Color.fromRGBO(9, 115, 81, 1)),
      ),
    ),
    ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color.fromRGBO(18, 45, 79, 1),
        iconTheme: IconThemeData(color: Color.fromRGBO(249, 247, 228, 1)),
        titleTextStyle: TextStyle(
          color: Color.fromRGBO(249, 247, 228, 1),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      scaffoldBackgroundColor: const Color.fromRGBO(249, 247, 228, 1),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color.fromRGBO(18, 45, 79, 1)),
        bodyMedium: TextStyle(color: Color.fromRGBO(18, 45, 79, 1)),
      ),
    ),
    ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color.fromRGBO(123, 0, 5, 1),
        iconTheme: IconThemeData(color: Color.fromRGBO(210, 180, 139, 1)),
        titleTextStyle: TextStyle(
          color: Color.fromRGBO(210, 180, 139, 1),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      scaffoldBackgroundColor: const Color.fromRGBO(210, 180, 139, 1),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color.fromRGBO(123, 0, 5, 1)),
        bodyMedium: TextStyle(color: Color.fromRGBO(123, 0, 5, 1)),
      ),
    ),
  ];

  final List<String> _themeNames = [
    "Light Mode",
    "Dark Mode",
    "Sunshade",
    "Blue Zodiac",
    "Japanese Maple"
  ];

  final List<TextStyle> _fonts = [
    GoogleFonts.roboto(),
    GoogleFonts.lobster(),
    GoogleFonts.poppins(),
    GoogleFonts.montserrat(),
    GoogleFonts.openSans(),
  ];

  final List<String> _fontNames = [
    "Roboto",
    "Lobster",
    "Poppins",
    "Montserrat",
    "Open Sans",
  ];

  // Getters for theme and font names
  List<String> get themeNames => _themeNames;
  List<TextStyle> get fonts => _fonts;
  List<String> get fontNames => _fontNames;

  void changeTheme(int index) {
    _themeData = _themes[index];
    notifyListeners();
  }

  void changeFont(int index) {
    _fontStyle = _fonts[index];
    notifyListeners();
  }
}
