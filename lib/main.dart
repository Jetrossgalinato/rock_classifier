import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/home_screen.dart';
import 'screens/map_screen.dart';
import 'screens/rock_types_screen.dart';

void main() {
  runApp(const RockClassifierApp());
}

class RockClassifierApp extends StatefulWidget {
  const RockClassifierApp({super.key});

  @override
  State<RockClassifierApp> createState() => _RockClassifierAppState();
}

class _RockClassifierAppState extends State<RockClassifierApp> {
  bool isDark = true;

  ThemeData get darkTheme {
    final Color bgDark = const Color(0xFF030303);
    final Color bg = const Color(0xFF0A0A0A);
    final Color bgLight = const Color(0xFF181818);
    final Color text = const Color(0xFFF2F2F2);
    final Color textMuted = const Color(0xFFB0B0B0);
    final Color border = const Color(0xFF474747);
    final Color primary = const Color(0xFFDE9B6B);
    final Color secondary = const Color(0xFF7FC6E6);
    final Color danger = const Color(0xFFBFA39E);
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bg,
      primaryColor: primary,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: primary,
        onPrimary: bgDark,
        secondary: secondary,
        onSecondary: bgDark,
        error: danger,
        onError: bgDark,
        background: bg,
        onBackground: text,
        surface: bgLight,
        onSurface: text,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: bgLight,
        foregroundColor: text,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFFF2F2F2),
        ),
        bodyMedium: TextStyle(fontSize: 16, color: Color(0xFFF2F2F2)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: bgLight,
        hintStyle: TextStyle(color: textMuted),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: border),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: bgDark,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: primary),
      ),
    );
  }

  ThemeData get lightTheme {
    final Color bg = const Color(0xFFF2F2F2);
    final Color bgLight = const Color(0xFFEAEAEA);
    final Color text = const Color(0xFF181818);
    final Color textMuted = const Color(0xFF636363);
    final Color border = const Color(0xFFB0B0B0);
    final Color primary = const Color(0xFFDE9B6B);
    final Color secondary = const Color(0xFF7FC6E6);
    final Color danger = const Color(0xFFBFA39E);
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: bg,
      primaryColor: primary,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: bg,
        secondary: secondary,
        onSecondary: bg,
        error: danger,
        onError: bg,
        background: bg,
        onBackground: text,
        surface: bgLight,
        onSurface: text,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: bgLight,
        foregroundColor: text,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF181818),
        ),
        bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF181818)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: bgLight,
        hintStyle: TextStyle(color: textMuted),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: border),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: bg,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: primary),
      ),
    );
  }

  void toggleTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rock Classifier',
      theme: isDark ? darkTheme : lightTheme,
      initialRoute: '/login',
      routes: {
        '/login': (context) =>
            LoginScreen(onThemeToggle: toggleTheme, isDark: isDark),
        '/register': (context) =>
            RegisterScreen(onThemeToggle: toggleTheme, isDark: isDark),
        '/forgot-password': (context) =>
            ForgotPasswordScreen(onThemeToggle: toggleTheme, isDark: isDark),
        '/home': (context) =>
            HomeScreen(onThemeToggle: toggleTheme, isDark: isDark),
        '/map': (context) =>
            MapScreen(onThemeToggle: toggleTheme, isDark: isDark),
        '/rock-types': (context) =>
            RockTypesScreen(onThemeToggle: toggleTheme, isDark: isDark),
      },
    );
  }
}
