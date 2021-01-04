import 'package:coffee_crew/models/user.dart';
import 'package:coffee_crew/services/database.dart';
import 'package:coffee_crew/shared/constants.dart';
import 'package:coffee_crew/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  //local form var
  String _currentName;
  String _currentSugar;
  int _currentStringth;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return
    StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        UserData userData = snapshot.data;
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Text(
                    'Update your brew settings',
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val == null ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  // dropdownButton
                  DropdownButtonFormField(
                      decoration: textInputDecoration,
                      value: _currentSugar ?? userData.sugar,
                      items: sugars.map((sugar) {
                        return DropdownMenuItem(
                          value: sugar,
                          child: Text('$sugar sugars'),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => _currentSugar = val)),
                  // slider
                  Slider(
                    value: (_currentStringth ?? userData.stringth).toDouble(),
                    activeColor:
                        Colors.brown[_currentStringth ?? userData.stringth],
                    inactiveColor:
                        Colors.brown[_currentStringth ?? userData.stringth],
                    min: 100.0,
                    max: 900.0,
                    divisions: 8,
                    onChanged: (val) =>
                        setState(() => _currentStringth = val.round()),
                  ),
                  // Update button
                  RaisedButton(
                    child: Text(
                      "Update",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.pink,
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        await DatabaseService(uid: user.uid).updateUserData(
                            _currentSugar ?? userData.sugar,
                            _currentName ?? userData.name,
                            _currentStringth ?? userData.stringth);
                      }
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
