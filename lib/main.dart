import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc package
import 'package:third_day_camp/Bloc/counter_bloc.dart';
import 'package:third_day_camp/widgets/splash.dart'; // Your existing imports

void main() {
  runApp(
    BlocProvider(
      create: (context) => CounterBloc(), // Provide your BLoC
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Splashscreen(), // Start with Splashscreen
    );
  }
}
