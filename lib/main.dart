import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:http/http.dart' as http;
import 'package:beautifulsoup/beautifulsoup.dart';

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

//    if (DynamicTheme.of(context).brightness == Brightness.dark) {
//      String mdi = "penis";
//    } else {
//      String mdi = "micro";
//    }

    String document = """
  <html><head><title>The Dormouse's story</title></head>
  <body>
  <p class="title"><b>The Dormouse's story</b></p>

  <p class="story">Once upon a time there were three little sisters; and their names were
  <a href="http://example.com/elsie" class="sister" id="link1">Elsie</a>,
  <a href="http://example.com/lacie" class="sister" id="link2">Lacie</a> and
  <a href="http://example.com/tillie" class="sister" id="link3">Tillie</a>;
  and they lived at the bottom of a well.</p>

  <p class="story">...</p>
  """;

    var url = 'http://example.com/whatsit/create';
    var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});

    var soup = Beautifulsoup(document);
    var titties = soup("title").outerHtml;

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
            Text('${titties}'),
            Text('Response body: ${response.body}!!!'),
            Text(
              '\n*insert dope text here*\n',
              textAlign: TextAlign.center,
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18.0),
            ),
            RaisedButton(
              child: Text('OPEN ROUTE'),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 4,
              shape: StadiumBorder(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
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
