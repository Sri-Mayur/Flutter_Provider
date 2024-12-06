import 'package:flutter/material.dart';
import 'package:learning_provider/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    // Access the theme provider
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: themeProvider.darkTheme
            ? const Color.fromARGB(255, 36, 34, 34)
            : const Color.fromARGB(255, 63, 35, 112),
        child: Center(
          child: GestureDetector(
            onTap: () {
              // Toggle the theme when the box is clicked
              themeProvider.updateTheme(!themeProvider.darkTheme);
            },
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5), // Semi-transparent white
                borderRadius:
                    BorderRadius.circular(16), // Optional rounded edges
              ),
              child: Center(
                child: Text(
                  themeProvider.darkTheme
                      ? "Switch to Light"
                      : "Switch to Dark",
                  style: TextStyle(
                    color:
                        themeProvider.darkTheme ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
