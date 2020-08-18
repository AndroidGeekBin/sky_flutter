
import 'package:flutter/material.dart';

import 'home/home.dart';
import 'me/me.dart';
import 'proifle/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavigationWidget(),
      //routes: {StringUtils.ROUTE_MESSAGE: (context) => MessagePage()},
    );
  }
}

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigationWidget> {
  int _currentIndex = 0;

  Widget _currentWidget = HomePage();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _currentWidget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        currentIndex: _currentIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text('公告'), icon: Icon(Icons.book)),
          BottomNavigationBarItem(
              title: Text('个人'), icon: Icon(Icons.perm_identity)),
        ],
      ),
    );
  }

  void _onTap(int index) {
    switch (index) {
      case 0:
        _currentWidget = HomePage();
        break;
      case 1:
        _currentWidget = ProfileWidget();
        break;
      case 2:
        _currentWidget = MePage();
        break;
    }

    setState(() {
      _currentIndex = index;
    });
  }
}
