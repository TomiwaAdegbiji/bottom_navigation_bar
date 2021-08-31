import 'package:flutter/material.dart';

class SwipeTabBar extends StatefulWidget {
  @override
  _SwipeTabBarState createState() => _SwipeTabBarState();
}

class _SwipeTabBarState extends State<SwipeTabBar> {

  final _pageViewController = PageController();

  int _activePage = 0;

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageViewController,
        children: <Widget>[
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.blue)
        ],
        onPageChanged: (index) {
          setState(() {
            _activePage = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activePage,
        onTap: (index) {
          _pageViewController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.bounceOut);
        },
        items: [
          BottomNavigationBarItem(icon: Text("R"), activeIcon: Text("Active"), title: Text("Red")),
          BottomNavigationBarItem(icon: Text("G"), activeIcon: Text("Active"), title: Text("Green")),
          BottomNavigationBarItem(icon: Text("B"), activeIcon: Text("Active"), title: Text("Blue")),
        ],
      ),
    );
  }
}