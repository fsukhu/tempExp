import 'package:first_real_attempt/widgets/item_widget.dart';
import 'package:flutter/material.dart';

import 'models/item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Color(0xFF3BBA57),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add from here...
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: _pushSaved,
          ),
        ],
        title: Text(
          'MM Garbage App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _buildSuggestions(),
    );
  }

  List<Item> items = List<Item>();
  Widget _buildSuggestions() {
    initialiseItems(items);

    return ListView(
      padding: const EdgeInsets.all(8),
      children: buildWidgets1(items),
    );
  }

  List<Widget> buildWidgets1(List<Item> items) {
    List<ItemWidget> widgets = List<ItemWidget>();
    for (var item in items) {
      ItemWidget widget = ItemWidget(item: item);
      widgets.add(widget);
    }
    return (widgets);
  }

  bool initialised = false;
  void initialiseItems(List<Item> items) {
    if (initialised) {
      return;
    }
    initialised = true;
    Item i = Item();
    i.title = "252 Flora St, Carleton Place";
    i.subtitle = "Sat, Jul 18, 2020";
    i.details.add("Household Hazardous Waste");
    i.details.add("Compost Yard Open");

    items.add(i);

    i = Item();
    i.title = "NEXT COLLECTION";
    i.subtitle = "Mon, Jul 20, 2020";
    i.details.add("Blue Box");
    i.details.add("Garbage");

    items.add(i);
  }

// go to next page

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // Add lines from here...
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('My New Pge'),
            ),
            //           body: ListView(children: divided),
          );
        }, // ...to here.
      ),
    );
  }
}
