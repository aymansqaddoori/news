import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(
                onPressed: () {
                  cubit.changThemeMode();
                },
                icon: Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            onTap: (value) => cubit.changeBottNavBar(index: value),
            currentIndex: cubit.currentIndex,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
