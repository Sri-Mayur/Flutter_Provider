import 'package:flutter/material.dart';
import 'package:learning_provider/provider/favourite_provider.dart';
import 'package:learning_provider/provider/slider_provider.dart';
import 'package:learning_provider/provider/count_provider.dart';
import 'package:learning_provider/provider/theme_provider.dart';
import 'package:learning_provider/screen/favourite/favourite.dart';
import 'package:learning_provider/screen/favourite/myfavourite.dart';
import 'package:learning_provider/screen/slider.dart';
import 'package:learning_provider/screen/count.dart';
import 'package:learning_provider/screen/theme.dart';
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
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            theme: themeChanger.darkTheme
                ? ThemeData.dark()
                : ThemeData(
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    useMaterial3: true,
                  ),
            home: const FavouriteExample(), // Default screen
            routes: {
              '/slider': (context) => const SliderExample(),
              '/count': (context) => const CountExample(),
              '/myFavourites': (context) => const MyFavouriteScreen(),
              '/theme': (context) => const ThemeScreen(),
            },
          );
        },
      ),
    );
  }
}
