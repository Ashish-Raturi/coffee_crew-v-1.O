import 'package:coffee_crew/models/brew.dart';
import 'package:coffee_crew/screens/home/brews_list.dart';
import 'package:coffee_crew/screens/home/setting_form.dart';
import 'package:coffee_crew/services/auth.dart';
import 'package:coffee_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthService _authService = AuthService();

    void _showSettingPannel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
              child: SettingForm());
        },
      );
    }

    return StreamProvider<List<Brew>>.value(
        value: DatabaseService().brews,
        child: Scaffold(
          backgroundColor: Colors.brown[100],
          appBar: AppBar(
            backgroundColor: Colors.brown,
            title: Text("Coffee Crew"),
            elevation: 0.0,
            actions: [
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text("Sign Out"),
                onPressed: () async {
                  await _authService.signOut();
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
                onPressed: () => _showSettingPannel(),
              )
            ],
          ),
          body: BrewsList(),
        ));
  }
}
