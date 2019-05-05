import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

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
//            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}