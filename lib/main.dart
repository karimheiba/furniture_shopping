import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/screen/subPages/order_screen.dart';

import 'screen/boarding.dart';
import 'screen/home_screen.dart';
import 'screen/login.dart';
import 'screen/my_card.dart';

import 'screen/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Boarding(),
        "login": (context) => Login(),
        "signup": (context) => SignUp(),
        "home": (context) => HomeScreen(),
        "myCard": (context) => MyCard(),
        // "productitem":(context) => ProductScreen(),
        "order":(context) => OrderScreen(),
      },
    
      title: 'furniture shopping',
      theme: ThemeData(),
    );
  }
}
