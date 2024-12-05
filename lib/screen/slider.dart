import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/slider_provider.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  @override
  Widget build(BuildContext context) {
    print("Scaffold Build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider Example with Provider"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(
            builder: (context, sliderProvider, child) {
              return Slider(
                value: sliderProvider.value,
                min: 0.0,
                max: 10.0,
                label: sliderProvider.value.toStringAsFixed(1),
                onChanged: (newValue) {
                  sliderProvider.updateValue(newValue);
                },
              );
            },
          ),
          Consumer<SliderProvider>(
            builder: (context, sliderProvider, child) {
              return Text(
                sliderProvider.value.toStringAsFixed(2),
                style: const TextStyle(fontSize: 50),
              );
            },
          ),
        ],
      ),
    );
  }
}
