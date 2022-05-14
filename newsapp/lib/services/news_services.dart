import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:newsapp/http/api_manager.dart';
import 'package:newsapp/models/news_response_model.dart';

class NewsDataService extends ApiManager {
  final Reader reader;
  GetStorage box = GetStorage();

  final getNewsDataUrl = '/top-headlines';
  NewsDataService(this.reader) : super(reader);

  // get news data with Nigeria (ng) as default country, english (en) as default language and general as the default category..
  Future<NewsResponseModel> getNewsData(
      {dynamic country, dynamic category, dynamic language}) async {
    final params = {'country': country, 'category': category, 'apiKey': APIKey};
    final response = await getHttp(getNewsDataUrl, params: params);
    if (response.responseCodeError == null) {
      return NewsResponseModel.fromJson(response.data);
    } else {
      return NewsResponseModel(status: 'false');
    }
  }
}
