import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed',
      home: MyImageFeed(),
    );
  }
}

class MyImageFeed extends StatelessWidget {
  final List<String> imageUrls = List.generate(10, (index) =>
  "https://via.placeholder.com/150?text=Image${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 1 : 2,
              childAspectRatio: 1.0,
            ),
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Image.network(imageUrls[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}