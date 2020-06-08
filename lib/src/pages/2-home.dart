import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
              Text('SOME TEXT HERE'),
            ],
          ),
        ),
      ),
    );
  }
}
