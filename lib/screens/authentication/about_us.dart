import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('About Application\n',
                    style: GoogleFonts.lobster(
                      fontSize: 28.0,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 1.0,
                      letterSpacing: 2.0,
                    )),
                Container(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/Coffee Crew logo.png',
                        height: 130.0,
                        width: 150.0,
                      ),
                      Text('Coffee Crew',
                          style: GoogleFonts.pacifico(
                            fontSize: 28.0,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 1.0,
                            letterSpacing: 2.0,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Coffee Crew is a mobile app that keeps track of team member\'s brew preferences and was built using Flutter with Cloud Firebase. It allows user to change the strength of their brew and sugar intake',
                  style: GoogleFonts.lobster(
                    fontSize: 18.0,
                    // color: c2,
                    fontWeight: FontWeight.w700,
                    wordSpacing: 1.0,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  '\nAbout Developer\n',
                  style: GoogleFonts.lobster(
                    fontSize: 28.0,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 1.0,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  'Hi, I\'m Ashish Raturi, a Flutter App Developer this is my First Project. I start this project on 15-Sep-2020 and completed it within 1 progressive week. \n\nThanks For Downloading it :)',
                  style: GoogleFonts.lobster(
                    fontSize: 18.0,
                    // color: c2,
                    fontWeight: FontWeight.w700,
                    wordSpacing: 1.0,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '\nDevelop In\n',
                  style: GoogleFonts.lobster(
                    fontSize: 28.0,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 1.0,
                    letterSpacing: 2.0,
                  ),
                ),
                Container(
                  child: Image.asset(
                    'assets/images/flutter.png',
                    height: 100.0,
                    width: 130.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
