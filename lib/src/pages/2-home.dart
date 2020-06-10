import 'package:flutter/material.dart';
import '../localization/localization_constants.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          margin: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/mountain.jpeg'),
              SizedBox(height: 8.0),
              Text(getTranslated(context, 'some_text_here')),
            ],
          ),
        ),
      ),
    );
  }
}
