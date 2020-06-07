import 'package:flutter/material.dart';
import '../mixins/email&passwordMixin.dart';

class ProfilePage extends StatelessWidget with EmailAndPasswordFields {
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              picture(),
              SizedBox(height: 40.0),
              email(),
              SizedBox(height: 20.0),
              password(),
              SizedBox(height: 40.0),
              logoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget picture() {
    return Container(
      width: 190,
      height: 190,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/profilePic.jpg'),
        ),
      ),
    );
  }

  Widget logoutButton() {
    return ButtonTheme(
      minWidth: 400.0,
      child: RaisedButton(
        child: Text('Logout'),
        color: Colors.blue,
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0)
        ),
        onPressed: () {},
      ),
    );
  }
}
