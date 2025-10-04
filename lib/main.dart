import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/home_layout.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsAppCubit()..getNews(),
      child: BlocConsumer<NewsAppCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsAppCubit.get(context);
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
              textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                elevation: 0.0,
                backgroundColor: HexColor('333739'),
                titleTextStyle: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
                iconTheme: IconThemeData(color: Colors.white, size: 30.0),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: HexColor('333739'),
                elevation: 20.0,
                selectedIconTheme: IconThemeData(color: Colors.deepOrange),
                selectedItemColor: Colors.deepOrange,
                unselectedLabelStyle: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
                selectedLabelStyle: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
                unselectedItemColor: Colors.grey,
              ),
              textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
            ),
            themeMode: cubit.isDark ? ThemeMode.light : ThemeMode.dark,
            home: HomeLayout(),
          );
        },
      ),
    );
  }
}
