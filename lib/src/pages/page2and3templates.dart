import 'package:flutter/material.dart';
import '../pages/2-home.dart';
import '../pages/3-profile.dart';

class Template2And3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Template2And3State();
  }
}

class Template2And3State extends State<Template2And3> {
  final profilePage = ProfilePage();
  int _currentIndex = 0;
  List<Widget> tabs = [
    HomePage(),
    ProfilePage(),
  ];
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitle(_currentIndex),
        ),
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
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
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
              Text('Logout'),
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
        'Home',
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
        'Profile',
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

  String pageTitle(pageno) {
    if (pageno == 0) {
      return 'Home';
    } else {
      return 'Profile';
    }
  }
}
