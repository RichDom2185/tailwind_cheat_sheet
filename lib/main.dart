import 'package:flutter/material.dart';
import 'package:tailwind_cheat_sheet/data/data_loader.dart';
import 'package:tailwind_cheat_sheet/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataLoader.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      title: 'Tailwind Cheat Sheet',
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
