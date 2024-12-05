import 'package:flutter/material.dart';
import 'package:learning_provider/provider/slider_provider.dart';
import 'package:learning_provider/provider/count_provider.dart';
import 'package:learning_provider/screen/slider.dart';
import 'package:learning_provider/screen/count.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => CountProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SliderExample(), // Default screen
        routes: {
          '/slider': (context) => const SliderExample(),
          '/count': (context) => const CountExample(),
        },
      ),
    );
  }
}
