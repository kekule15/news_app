import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/services/news_services.dart';
import 'package:newsapp/view_models/news_data_vm.dart';

final newsDataRequestProvider = ChangeNotifierProvider<NewsDataViewModel>(
    (ref) => NewsDataViewModel(ref.read));

final newsDataServiceProvider =
    Provider<NewsDataService>((ref) => NewsDataService(ref.read));
