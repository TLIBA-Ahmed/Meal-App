import 'package:flutter/material.dart';
import 'package:flutter_application_4/screens/tabs_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 132, 0, 51),
                brightness: Brightness.dark),
            useMaterial3: true,
            textTheme: GoogleFonts.latoTextTheme()),
        home: const TabsScreen());
  }
}
