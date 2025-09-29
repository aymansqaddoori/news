import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business_screen/business.dart';
import 'package:news_app/modules/science_screen/science.dart';
import 'package:news_app/modules/setting_screen/setting.dart';
import 'package:news_app/modules/sports_screen/sport.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsAppCubit extends Cubit<NewsAppStates> {
  NewsAppCubit() : super(InitailAppStat());
  static NewsAppCubit get(BuildContext context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> screens = [Business(), Sport(), Science(), Setting()];
  void changeBottNavBar({required int index}) {
    currentIndex = index;
    emit(ChangeBottNavBar());
  }

  List<dynamic> articles = [];
  void getNews() {
    DioHelper.getData(
          url: 'v2/everything',
          queryParameters: {
            'q': 'Apple',
            'from': '2025-09-29',
            'sortBy': 'popularity ',
            'apiKey': '07e3a12be91444afa9d312fd04a426a6',
          },
        )
        .then((value) {
          articles = value.data['articles'];
          print('${articles[0]['title']}');
          emit(GetNewsSuccesState());
        })
        .catchError((err) {
          SnackBar(content: Text(err));
          emit(GetNewsErrorState());
        });
  }
}
