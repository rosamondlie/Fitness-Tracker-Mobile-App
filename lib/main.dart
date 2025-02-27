import 'package:fitness_tracker/model/user.dart';
import 'package:fitness_tracker/pages/home.dart';
import 'package:fitness_tracker/pages/landing.dart';
import 'package:fitness_tracker/pages/water.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => User(),
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
      ),
      initialRoute: '/water',
      routes: {
        '/landing': (context) => const Landing(),
        '/home': (context) => const Home(),
        '/water': (context) => const Water()
      },
    );
  }
}

