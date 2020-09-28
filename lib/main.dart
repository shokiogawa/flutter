import 'package:flutter/material.dart';
import 'package:kboy/viwemodel/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

import 'view/screens/home_screen.dart';



void main() {
  runApp(
    ChangeNotifierProvider<NewsListViewModel>(
      create :(context) => NewsListViewModel(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NewsFeed",
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Bold",

      ),
      home: HomeScreen(),
    );
  }
}


