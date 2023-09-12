import 'package:flutter/material.dart';
// import 'package:practice_meals_app/data/dummy_data.dart';
// import 'package:practice_meals_app/screens/category_screen.dart';
import 'package:practice_meals_app/screens/tab_screen.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:practice_meals_app/models/category.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home:const  TabScreen()
    );
  }
}