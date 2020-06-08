import 'package:App_Project1/src/BLOC/provider.dart';
import 'package:flutter/material.dart';
import '../BLOC/bloc.dart';

class ProfilePage extends StatelessWidget {
  build(context) {
    final bloc = Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              picture(picWidth: 190, picHeight: 190),
              SizedBox(height: 40.0),
              email(bloc),
              SizedBox(height: 20.0),
              password(bloc),
              SizedBox(height: 40.0),
              logoutButton(bloc),
            ],
          ),
        ),
      ),
    );
  }

  Widget picture({@required double picWidth, @required double picHeight}) {
    return Container(
      width: picWidth,
      height: picHeight,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/profilePic.jpg'),
        ),
      ),
    );
  }

  Widget email(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            prefixIcon: Icon(Icons.email),
            hintText: 'Email',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget password(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            prefixIcon: Icon(Icons.lock),
            hintText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget logoutButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.emailAndpassword,
      builder: (context, snapshot) {
        return ButtonTheme(
          minWidth: 400.0,
          child: RaisedButton(
            child: Text('Logout'),
            textColor: Colors.white,
            color: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            onPressed: snapshot.hasData
                ? () {
                    bloc.submit();
                    Navigator.pop(context);
                  }
                : null,
          ),
        );
      },
    );
  }
}
