import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/view_models/category_vm.dart';

final categoryViewModel = ChangeNotifierProvider<CategoryViewModel>(
    (ref) => CategoryViewModel(ref.read));

final mychecker = StateProvider.autoDispose<bool>((ref) => false);
