import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/models/future_manager.dart';
import 'package:newsapp/models/news_response_model.dart';
import 'package:newsapp/providers/news_data_provider.dart';
import 'package:newsapp/providers/providers.dart';
import 'package:newsapp/view_models/base_vm.dart';

class NewsDataViewModel extends BaseViewModel {
  final Reader reader;
  int _currentIndex = 0;

  FutureManager<NewsResponseModel> newsData = FutureManager();
  double budgetAmount = 0;

  int get currentIndex => _currentIndex;

  NewsDataViewModel(this.reader) : super(reader) {
    getNewsData();
  }

  getNewsData({
    dynamic language = 'en',
  }) async {
    final category = reader(categoryViewModel).categoryCode;
     final countryCode = reader(countryListViewModel).selectedcountryCode;
    newsData.load();
    notifyListeners();
    final res = await reader(newsDataServiceProvider)
        .getNewsData(country: countryCode, category: category, language: language);
    if (res.articles!.isNotEmpty == true) {
      newsData.onSuccess(res);

      notifyListeners();
    } else {
      newsData.onError('Error');
      notifyListeners();
    }
  }

  onChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
