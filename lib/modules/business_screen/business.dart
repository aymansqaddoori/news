import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class Business extends StatelessWidget {
  const Business({super.key});

  @override
  Widget build(BuildContext context) {
    var articles = NewsAppCubit.get(context).articles;
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      builder: (context, state) => ConditionalBuilder(
        condition: true,
        builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => newsCard(articles: articles[index]),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(height: 1.0, color: Colors.grey),
          ),
          itemCount: articles.length,
        ),
        fallback: (context) => Center(child: CircularProgressIndicator()),
      ),
      listener: (context, state) {},
    );
  }
}
