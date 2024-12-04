import 'package:flutter/material.dart';
import 'package:learning_provider/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print("Build Scaffold");
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Provider",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Consumer<CountProvider>(
              builder: (context, value, child) {
                print("Build Text");
                return Text(
                  value.count.toString(),
                  style: TextStyle(fontSize: 50),
                );
              },
            )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            countProvider.setCount();
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.deepPurple,
        ));
  }
}
/**
 1. NotifyListener: It is a widget that wraps the part of the UI that needs to be updated when the state changes. It listens for state changes and triggers a rebuild of the wrapped widget subtree.

2. Provider.of<Class>(context): This syntax is used to access the provided instance of a specific class within the widget tree. It retrieves the nearest ancestor Provider widget of type Class and returns the instance.

3. Consumer: It is a widget that allows accessing and using the provided data within its subtree. It receives the provided instance of a class and rebuilds its child widget tree when the state changes.
 */