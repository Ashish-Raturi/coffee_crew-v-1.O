import 'package:coffee_crew/models/brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({this.brew});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        // color: Colors.brown[100],
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[brew.strength],
            child: Image.asset("assets/images/cup.png"),
          ),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.sugar} sugas\'s'),
        ),
      ),
    );
  }
}
