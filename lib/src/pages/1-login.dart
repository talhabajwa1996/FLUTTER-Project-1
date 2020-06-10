import 'package:flutter/material.dart';
import '../BLOC/bloc.dart';
import '../BLOC/provider.dart';
import 'page2and3templates.dart';
import '../../main.dart';
import '../classes/language.dart';
import '../localization/localization_constants.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  void _changeLanguage(Language language) async {
    Locale _temp = await setLocale(language.languageCode);

    MyApp.setLocale(context, _temp);
  }

  build(context) {
    final bloc = Provider.of(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        margin: EdgeInsets.all(20.0),
        // child: _dropDownMenu(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            loginWidget(),
            SizedBox(height: 80.0),
            email(bloc),
            SizedBox(height: 20.0),
            password(bloc),
            SizedBox(height: 20.0),
            submitButton(bloc),
            SizedBox(height: 20.0),
            _dropDownMenu(),
          ],
        ),
      ),
    );
  }

  Widget loginWidget() {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 20.0),
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
            getTranslated(context, 'login'),
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'SourceSansLight',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
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
            hintText: streamHintText('email'),
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
            hintText: streamHintText('password'),
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.emailAndpassword,
      builder: (context, snapshot) {
        return ButtonTheme(
          minWidth: 400.0,
          child: RaisedButton(
            child: Text(
              streamHintText('submit'),
            ),
            textColor: Colors.white,
            color: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            onPressed: snapshot.hasData
                ? () {
                    bloc.submit();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Template2And3(),
                      ),
                    );
                  }
                : null,
          ),
        );
      },
    );
  }

  Widget _dropDownMenu() {
    return DropdownButton<Language>(
      hint: Text(
        getTranslated(context, 'select_language'),
        style: TextStyle(color: Colors.blue),
      ),
      onChanged: (Language language) {
        _changeLanguage(language);
      },
      items: Language.languageList()
          .map<DropdownMenuItem<Language>>(
            (lang) => DropdownMenuItem(
              value: lang,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text(lang.flag), Text(lang.name)],
              ),
            ),
          )
          .toList(),
    );
  }

  String streamHintText(String jsonText) {
    return getTranslated(context, jsonText);
  }
}
