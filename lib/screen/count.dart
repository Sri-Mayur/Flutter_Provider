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
