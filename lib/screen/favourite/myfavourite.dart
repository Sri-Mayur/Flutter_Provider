import 'package:flutter/material.dart';
import 'package:learning_provider/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({super.key});

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Favourite",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Consumer<FavouriteProvider>(builder: (context, value, child) {
        final favouriteItems = value.favlist;
        return favouriteItems.isEmpty
            ? Center(child: Text("No favourite items yet"))
            : ListView.builder(
                itemCount: favouriteItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Item " + favouriteItems[index].toString()),
                  );
                });
      }),
    );
  }
}
