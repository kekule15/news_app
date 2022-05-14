import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/view_models/base_vm.dart';

class CountryListViewModel extends BaseViewModel {
  int selectedIndex = 1;
  String selectedcountry = 'Nigeria';
  String selectedcountryCode = 'ng';
  CountryListViewModel(Reader read) : super(read);

  void changeIndex(int index, String country, String countryCode) {
    selectedIndex = index;
    selectedcountry = country;
    selectedcountryCode = countryCode;

    notifyListeners();
  }
}
