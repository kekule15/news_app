import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/view_models/base_vm.dart';

class CategoryViewModel extends BaseViewModel {
  int selectedIndex = 0;
  String categoryCode = 'general';
  CategoryViewModel(Reader read) : super(read);

  void changeIndex(int index, String category) {
    selectedIndex = index;
    categoryCode = category;
    notifyListeners();
  }
}
