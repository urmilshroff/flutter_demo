import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

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
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'img/flutter-logo.png',
              height: 150,
              width: 150,
            ),
            Text('Welcome to the Flutter Demo App!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                )),
            Text(
              '\n*insert dope text here*\n',
              textAlign: TextAlign.center,
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18.0),
            ),
            RaisedButton(
              child: Text('TOGGLE LIGHTS'),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 4,
              shape: StadiumBorder(),
              onPressed: changeBrightness,
//              () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => SecondRoute()),
//                );
//              },
            ),
          ],
        ),
      ),

//      floatingActionButton: FloatingActionButton(
//        onPressed: changeBrightness,
//        tooltip: 'Light/dark mode',
//        child: Icon(Icons.brightness_2),
//      ),

      bottomNavigationBar: BottomNavyBar(
          currentIndex: currentIndex,
        iconSize: 25,
        onItemSelected: (index) => setState(() {
              currentIndex = index;
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

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('CLOSE ROUTE'),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 4,
          shape: StadiumBorder(),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
