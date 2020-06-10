import 'package:flutter/material.dart';
import '2-home.dart';
import '3-profile.dart';
import '../classes/language.dart';
import '../../main.dart';
import '../localization/localization_constants.dart';

class Template2And3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Template2And3State();
  }
}

class Template2And3State extends State<Template2And3> {
  void _changeLanguage(Language language) async {
    Locale _temp = await setLocale(language.languageCode);

    MyApp.setLocale(context, _temp);
  }

  final profilePage = ProfilePageState();
  int _currentIndex = 0;
  List<Widget> tabs = [
    HomePage(),
    ProfilePage(),
  ];
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle(_currentIndex)),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: _dropDownMenu(),
          ),
        ],
        centerTitle: true,
      ),
      resizeToAvoidBottomPadding: false,
      drawer: sideDrawer(),
      body: tabs[_currentIndex],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text(getTranslated(context, 'home')),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text(getTranslated(context, 'profile')),
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  Widget sideDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          sideDrawerHeader(),
          sideDrawerHome(),
          sideDrawerProfile(),
          SizedBox(height: 350),
          sideDrawerLOGOUTButton(),
        ],
      ),
    );
  }

  Widget sideDrawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            profilePage.picture(picWidth: 100, picHeight: 100),
            SizedBox(height: 6),
            Text(
              'talhabajwa1996@gmail.com',
              style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget sideDrawerLOGOUTButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
      child: Center(
        child: RaisedButton(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.arrow_back_ios),
              SizedBox(width: 12.0),
              Text(getTranslated(context, 'logout')),
            ],
          ),
          textColor: Colors.white,
          color: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget sideDrawerHome() {
    return ListTile(
      leading: Icon(Icons.home),
      title: Text(
        getTranslated(context, 'home'),
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      onTap: () {
        setState(() {
          _currentIndex = 0;
        });
        Navigator.pop(context);
      },
    );
  }

  Widget sideDrawerProfile() {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(
        getTranslated(context, 'profile'),
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      onTap: () {
        setState(() {
          _currentIndex = 1;
        });
        Navigator.pop(context);
      },
    );
  }

  Widget _dropDownMenu() {
    return DropdownButton(
      onChanged: (Language language) {
        _changeLanguage(language);
      },
      underline: SizedBox(),
      icon: Icon(
        Icons.language,
        color: Colors.white,
      ),
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

  String pageTitle(pageno) {
    if (pageno == 0) {
      return getTranslated(context, 'home');
    } else {
      return getTranslated(context, 'profile');
    }
  }
}
