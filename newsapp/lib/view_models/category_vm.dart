
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/view_models/base_vm.dart';

class CategoryViewModel extends BaseViewModel {
  int selectedIndex = 0;
  CategoryViewModel(Reader read) : super(read) {
   
  }


  void changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
