import 'package:flutter/material.dart';
import 'package:learning_provider/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavouriteExample extends StatefulWidget {
  const FavouriteExample({super.key});

  @override
  State<FavouriteExample> createState() => _FavouriteExampleState();
}

class _FavouriteExampleState extends State<FavouriteExample> {
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourites",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/myFavourites');
              },
              icon: Icon(Icons.favorite_border))
        ],
      ),
      body: Column(
        children: [
          Expanded(child:
              Consumer<FavouriteProvider>(builder: (context, value, child) {
            return ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                final isFavourite = value.favlist.contains(index);
                return ListTile(
                  title: Text("Item " + index.toString()),
                  trailing: Icon(
                      isFavourite ? Icons.favorite : Icons.favorite_outline),
                  onTap: () {
                    if (isFavourite) {
                      value.removeItem(index);
                    } else {
                      value.addItem(index);
                    }
                  },
                );
              },
            );
          }))
        ],
      ),
    );
  }
}
