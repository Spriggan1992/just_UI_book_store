import 'package:book_store/screens/first_screen.dart';
import 'package:flutter/material.dart';

import 'screens/second_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryTextTheme: TextTheme(),
        textTheme: TextTheme(
          headline1: TextStyle(fontWeight: FontWeight.bold),
          headline6: TextStyle(fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontFamily: 'Hind'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: FirstScreen.id,
      routes: {
        FirstScreen.id: (_) => FirstScreen(),
        SecondScreen.id: (_) => SecondScreen(),
      },
    );
  }
}
