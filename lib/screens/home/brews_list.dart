import 'package:coffee_crew/models/brew.dart';
import 'package:coffee_crew/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewsList extends StatefulWidget {
  @override
  _BrewsListState createState() => _BrewsListState();
}

class _BrewsListState extends State<BrewsList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context) ?? [];
    return Stack(children: [
      Container(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          'assets/images/background image.png',
        ),
      ),
      ListView.builder(
        itemCount: brews.length,
        itemBuilder: (context, index) {
          return BrewTile(brew: brews[index]);
        },
      ),
    ]);
  }
}
