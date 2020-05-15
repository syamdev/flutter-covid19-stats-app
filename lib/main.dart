import 'package:covid19_stats/config/env.dart';
import 'package:covid19_stats/view/detail/detail_page.dart';
import 'package:covid19_stats/view/home/home_page.dart';
import 'package:flutter/material.dart';

// TODO 18 : remove all and change

void main() {
  runApp(
    MainApp(),
  );
}

class MainApp extends StatelessWidget {
  final Map<String, WidgetBuilder> _routes = <String, WidgetBuilder>{
    Env.homeRoute: (BuildContext context) {
      return HomePage();
    },
    Env.detailRoute: (BuildContext context) {
      return DetailPage();
    },
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _routes,
      initialRoute: Env.homeRoute,
    );
  }
}