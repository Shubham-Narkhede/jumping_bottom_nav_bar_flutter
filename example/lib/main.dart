import 'package:flutter/material.dart';
import 'package:jumping_bottom_nav_bar_flutter/jumping_bottom_nav_bar_flutter.dart';
import 'package:jumping_bottom_nav_bar_flutter/source/tab_icon.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Title',
      home: BottomBarPage(),
    );
  }
}

class BottomBarPage extends StatefulWidget {
  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int selectedIndex = 1;

  final iconList = [
    TabIcon(
        iconData: Icons.home,
        startColor: Colors.white,
        endColor: Colors.yellow),
    TabIcon(
        iconData: Icons.healing,
        startColor: Colors.white,
        endColor: Colors.yellowAccent),
    TabIcon(
        iconData: Icons.person,
        startColor: Colors.white,
        endColor: Colors.yellowAccent),
  ];
  void onChangeTab(int index) {
    selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: iconList.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Jumping Bottom Bar"),
        ),
        body: TabBarView(
          children: [
            new Container(
              child: Center(
                child: Text("FIRST TAB"),
              ),
            ),
            new Container(
              child: Center(
                child: Text("SECOND TAB"),
              ),
            ),
            new Container(
              child: Center(
                child: Text("THIRD TAB"),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Jumping_Bar(
          color: Colors.blue,
          onChangeTab: onChangeTab,
          duration: Duration(seconds: 1),
          circleGradient: RadialGradient(
            colors: [
              Colors.purpleAccent.shade100,
              Colors.red.shade900,
            ],
          ),
          items: iconList,
          selectedIndex: selectedIndex,
        ),
      ),
    );
  }
}
