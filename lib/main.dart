import 'package:flutter/material.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            bodySmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          fontFamily: "Lato",
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 213, 1),
            primary: const Color.fromARGB(255, 255, 213, 1),
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.system,
        title: 'Shopping App',
        home: const Home(),
      ),
    );
  }
}
