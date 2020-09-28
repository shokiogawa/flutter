import 'dart:js';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kboy/data/category_info.dart';
import 'package:kboy/data/serch_type.dart';
import 'package:kboy/models/model/news_model.dart';
import 'package:kboy/models/networking/api_service.dart';

class NewsRepository{

  final ApiService _apiService = ApiService.create();


 Future<List<Article>> getNews({@required SearchType searchType, Category category, String keyword}) async{

   List<Article> result = List<Article>();
   Response response;

   try{

     switch(searchType){
       case SearchType.HEAD_LINE:
          response = await _apiService.getHeadlines();
         break;
       case SearchType.KEYWORD:
         response = await _apiService.getKeyWords(keyword: keyword);
         break;
       case SearchType.CATEGORY:
         response = await _apiService.getCategory(category: category.nameEn);
         break;

     }
     if (response.isSuccessful){
       final responseBody = response.body;
       print('$responseBody');
       result = News.fromJson(responseBody).article;

     }else{
       final errorCode = response.statusCode;
       final error = response.error;
       print("$error/ $errorCode");
     }
   }
   catch(error){
   }
   return result;
 }

 void dispose(){
   _apiService.dispose();
 }
}