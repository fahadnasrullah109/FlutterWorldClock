import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:worldclockapp/screens/home_screen.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 3,
        navigateAfterSeconds: HomeScreen(),
        title: new Text(
          'World Clock',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              fontFamily: 'ComicNeue',
              color: Colors.white),
        ),
        image: Image.asset('assets/ic_clock.png'),
        backgroundColor: Colors.blue,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 80.0,
        loaderColor: Colors.white);
  }
}
