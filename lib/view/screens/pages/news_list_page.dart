import 'package:flutter/material.dart';
import 'package:kboy/data/category_info.dart';
import 'package:kboy/data/serch_type.dart';
import 'package:kboy/view/components/category_chipes.dart';
import 'package:kboy/view/components/search_bar.dart';
import 'package:kboy/viwemodel/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          tooltip: "更新してね",
          onPressed: () {
            onRefresh(context);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SearchBar(
                onSearch: (keyword){
                  getKeyWordNews(context, keyword);
                },
              ),
              CategoryChipes(
                onCategorySelected: (category){
                  getCategoryNews(context, category);
                },
              ),
              Expanded(
                  child: Center(
                      child: CircularProgressIndicator())),
            ],
          ),
        )
      ),
    );
  }

  Future<void> onRefresh(BuildContext context) async{
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(searchType: viewModel.searchType, keyword: viewModel.keyword, category: viewModel.category);
  }

  Future<void> getKeyWordNews(BuildContext context, keyword) async{
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(searchType: SearchType.KEYWORD, keyword: keyword, category: categories[0]);
  }

  Future<void> getCategoryNews(BuildContext context, category) async{
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(searchType: SearchType.CATEGORY, category: category);
  }
}
