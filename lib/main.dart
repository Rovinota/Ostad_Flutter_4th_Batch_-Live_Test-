import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> items = [
    Item('Item 1', false),
    Item('Item 2', false),
    Item('Item 3', false),
    Item('Item 4', false),
    Item('Item 5', false),
  ];

  int selectedCount = 0;

  void _updateSelectedCount() {
    int count = 0;
    for (var item in items) {
      if (item.isSelected) {
        count++;
      }
    }
    setState(() {
      selectedCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selection Screen"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                items[index].isSelected = !items[index].isSelected;
                _updateSelectedCount();
              });
            },
            child: Container(
              width: items[index].isSelected ? double.infinity : null,
              color: items[index].isSelected ? Colors.blue : null,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  items[index].name,
                  style: TextStyle(
                    color: items[index].isSelected ? Colors.white : Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Selected Items'),
                content: Text('Number of selected items: $selectedCount'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}

class Item {
  String name;
  bool isSelected;

  Item(this.name, this.isSelected);
}
