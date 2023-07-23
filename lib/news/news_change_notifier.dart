import 'package:flutter/material.dart';
import 'news_service.dart';
import '../article/article.dart';

class NewsChangeNotifier extends ChangeNotifier {
  final NewsService _newsService;

  NewsChangeNotifier(this._newsService);

  List<Article> _articles = [];

  List<Article> get articles => _articles;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getArticles() async {
    _isLoading = true;
    notifyListeners();
    final response = await _newsService.getArticles();
    _articles = response;
    _isLoading = false;
    notifyListeners();
  }
}
