import 'package:automotive_innovation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard_screen.dart';
import 'ml/detection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
// Constructor
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Automation',
      home: SplashScreen(),
      getPages: [
        GetPage(name: '/dashboard', page: () => DashboardScreen()),
        GetPage(name: '/detection', page: () => Detection()),
      ],
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFEEF1F8),
        fontFamily: "Intel",
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          errorStyle: TextStyle(height: 0),
          border: defaultInputBorder,
          enabledBorder: defaultInputBorder,
          focusedBorder: defaultInputBorder,
          errorBorder: defaultInputBorder,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 14, // Set your desired text size here
            color: Colors.black54, // Set your desired text color here
          ),
        ),
        textSelectionTheme:
            const TextSelectionThemeData(selectionColor: Colors.transparent),
      ),
    );
  }

  static const defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(
      color: Color(0xFFDEE3F2),
      width: 1,
    ),
  );

  MaterialColor createMaterialColor(Color color) {
    List<int> strengths = <int>[
      50,
      100,
      200,
      300,
      400,
      500,
      600,
      700,
      800,
      900
    ];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int strength in strengths) {
      final double opacity = 1.0 - (strength / 900.0);
      swatch[strength] = Color.fromRGBO(r, g, b, opacity);
    }

    return MaterialColor(color.value, swatch);
  }

  MaterialColor fromRGBToMaterialColor(Color color) {
    List<double> strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds / 0.5).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds / 0.5).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds / 0.5).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
