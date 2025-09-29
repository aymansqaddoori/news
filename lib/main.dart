import 'package:flutter/material.dart';
import 'package:news_app/layout/home_layout.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

void main() async {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 20.0,
          selectedIconTheme: IconThemeData(color: Colors.deepOrange),
          selectedItemColor: Colors.deepOrange,
          unselectedLabelStyle: TextStyle(fontSize: 16.0),
          selectedLabelStyle: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
          iconTheme: IconThemeData(color: Colors.black, size: 30.0),
        ),

        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeLayout(),
    );
  }
}
