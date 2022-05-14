import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/view_models/news_category_vm.dart';
import 'package:newsapp/view_models/news_country_category_list_vm.dart';

final categoryViewModel = ChangeNotifierProvider<CategoryViewModel>(
    (ref) => CategoryViewModel(ref.read));

final countryListViewModel = ChangeNotifierProvider<CountryListViewModel>(
    (ref) => CountryListViewModel(ref.read));

final mychecker = StateProvider.autoDispose<bool>((ref) => false);
