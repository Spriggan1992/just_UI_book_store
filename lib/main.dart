import 'package:book_store/screens/first_screen/first_screen.dart';
import 'package:flutter/material.dart';

import 'screens/second_screen/second_screen.dart';

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
          bodyText2: TextStyle(fontFamily: 'Rubik'),
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
