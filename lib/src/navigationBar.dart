import 'package:flutter/material.dart';
import 'pages/2-home.dart';
import 'pages/3-profile.dart';

class NavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NavigationBarState();
  }
}

class NavigationBarState extends State<NavigationBar>{
  int _currentIndex = 0;
  List<Widget> tabs = [
    HomePage(),
    ProfilePage(),
  ];
  build(context) {
    return Scaffold(
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
      onTap: (index){
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}