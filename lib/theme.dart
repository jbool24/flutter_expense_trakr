import 'package:flutter/material.dart';

ThemeData appTheme() => ThemeData(
    primarySwatch: Colors.green,
    accentColor: Colors.greenAccent,
    fontFamily: 'Quicksand',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: ThemeData.light().textTheme.copyWith(
          button: TextStyle(color: Colors.white),
        ),
    appBarTheme: AppBarTheme(
        textTheme: ThemeData.light().textTheme.copyWith(
              // ignore: deprecated_member_use
              title: TextStyle(
                  fontFamily: 'OpenSans', fontSize: 20, letterSpacing: 1.3),
            )));
