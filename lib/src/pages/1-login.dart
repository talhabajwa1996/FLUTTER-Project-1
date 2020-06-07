import 'package:flutter/material.dart';
import '../mixins/email&passwordMixin.dart';
import '../navigationBar.dart';

class LoginPage extends StatelessWidget with EmailAndPasswordFields {
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              loginWidget(),
              SizedBox(height: 20.0),
              email(),
              SizedBox(height: 20.0),
              password(),
              SizedBox(height: 20.0),
              SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginWidget() {
    return Container(
      margin: EdgeInsetsDirectional.only(top:20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/Icons/login.png'),
            height: 100,
            width: 100,
          ),
          SizedBox(height: 8.0),
          Text(
            'Login',
            style: TextStyle(
              fontSize:40,
              fontFamily: 'SourceSansLight',
              fontWeight: FontWeight.w700,

            ),
          ),
        ],
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  @override
  build(context) {
    return ButtonTheme(
      minWidth: 400.0,
      child: RaisedButton(
        child: Text(
          'Submit',
        ),
        color: Colors.blue,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavigationBar(),
            ),
          );
        },
      ),
    );
  }
}
