import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:splashscreen/splashscreen.dart';

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

//class MySplashScreen extends StatefulWidget {
//  MySplashScreen({Key key, this.title}) : super(key: key);
//
//  final String title; //always marked final
//
//  @override
//  _MySplashScreenState createState() => _MySplashScreenState();
//}
//
//class _MySplashScreenState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return new SplashScreen(
//        seconds: 5,
//        navigateAfterSeconds: new MyHomePage(),
//        title: new Text('Change This'),
//        image: new Image.network(
//            'https://flutter.dev/assets/flutter-lockup-4cb0ee072ab312e59784d9fbf4fb7ad42688a7fdaea1270ccf6bbf4f34b7e03f.svg'),
//        backgroundColor: Colors.white,
//        photoSize: 100.0,
//        loaderColor: Colors.red);
//  }
//}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;

      // Calling setState tells Flutter that something has changed in this
      // state and that it needs to be updated in the next build/run

      // setState() also calls Widget build() below automatically
    });
  }

  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }

  void changeColor() {
    DynamicTheme.of(context).setThemeData(new ThemeData(
        primaryColor: Theme.of(context).primaryColor == Colors.blue
            ? Colors.red
            : Colors.blue));
  }

  @override
  Widget build(BuildContext context) {
    //this method is called by setState above
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to the Flutter Demo App!',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              'Insert dope text here',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeBrightness,
        tooltip: 'Light/dark mode',
        child: Icon(Icons.brightness_2),
      ),
    );
  }
}
