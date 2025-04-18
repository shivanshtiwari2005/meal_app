import 'package:flutter/material.dart';
import 'package:meal_app/screens/tabs.dart';
//import 'package:meal_app/screens/categories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 131, 57, 0)),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);

void main() {
  runApp(const ProviderScope(
    child: App(),
  ),
    );
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
      );

  }
}
