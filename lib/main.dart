import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'first_route.dart';
import 'second_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) =>
            new ThemeData(primarySwatch: Colors.blue, brightness: brightness),
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: theme,
            home: MyHomePage(title: 'Flutter Demo'),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title; //always marked final

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  static final controller = PageController(
    initialPage: 0,
  );

  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }

  void changeColor() {
    DynamicTheme.of(context).setThemeData(new ThemeData(
        primaryColor: Theme.of(context).primaryColor == Colors.blue
            ? Colors.blue
            : Colors.blue));
  }

  @override
  Widget build(BuildContext context) {
    //this method is called by setState above

//    if (DynamicTheme.of(context).brightness == Brightness.dark) {
//      String mdi = "penis";
//    } else {
//      String mdi = "micro";
//    }
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Home Page"),
//      ),

      body: PageView(
        controller: controller,
        children: <Widget>[
          FirstRoute(),
          SecondRoute(),
        ],
      ),

      bottomNavigationBar: BottomNavyBar(
        currentIndex: currentIndex,
        iconSize: 25,
        onItemSelected: (index) => setState(() {
              currentIndex = index;
//              if (currentIndex != 0)
//              {
//                  Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => SecondRoute()),
//                );
//              }
            }),
        items: [
          BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Colors.lightBlue,
              inactiveColor: Colors.blue),
          BottomNavyBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorites'),
              activeColor: Colors.lightBlue,
              inactiveColor: Colors.blue),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.lightBlue,
              inactiveColor: Colors.blue),
          BottomNavyBarItem(
              icon: Icon(Icons.info),
              title: Text('Info'),
              activeColor: Colors.lightBlue,
              inactiveColor: Colors.blue),
        ],
      ),
    );
  }
}