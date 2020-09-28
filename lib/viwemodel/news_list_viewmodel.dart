import 'package:flutter/material.dart';
import 'package:kboy/data/category_info.dart';
import 'package:kboy/data/serch_type.dart';
import 'package:kboy/models/model/news_model.dart';
import 'package:kboy/models/repository/news_repository.dart';

class NewsListViewModel extends ChangeNotifier{
  final NewsRepository _repository = NewsRepository();

  SearchType _searchType = SearchType.CATEGORY;
  SearchType get searchType => _searchType;

  Category _category = categories[0];
  Category get category => _category;

  String _keyword = "";
  String get keyword => _keyword;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Article> _article = List();
  List<Article> get article => _article;

  Future<void> getNews({
    @required SearchType searchType, Category category, String keyword}) async{
    _searchType = searchType;
    _category = category;
    _keyword = keyword;

    _isLoading = true;
    notifyListeners();

    print('ViewModel searchtype:$searchType / category:${category.nameJp} keyword: $keyword /article ${_article[0].title}');
    
    _article = await _repository.getNews(searchType: _searchType, keyword: _keyword, category: _category);
    _isLoading = false;
    notifyListeners();


  }

  @override
  void dispose() {
    _repository.dispose();
  }

}