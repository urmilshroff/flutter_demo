import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("First Route"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              Image.asset(
//                'img/flutter-logo.png',
//                height: 150,
//                width: 150,
//              ),
              FlutterLogo(size: 100),
              Text('Welcome to the Flutter Demo App!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
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
//              onPressed: changeBrightness,
//              () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => SecondRoute()),
//                );
//              },
              ),
            ],
          ),

//      floatingActionButton: FloatingActionButton(
//        onPressed: changeBrightness,
//        tooltip: 'Light/dark mode',
//        child: Icon(Icons.brightness_2),
//      ),
        ));
  }
}
