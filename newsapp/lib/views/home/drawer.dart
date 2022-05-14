import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/styles/appColors.dart';
import 'package:newsapp/utils/providers.dart';
import 'package:newsapp/utils/news_category_list.dart';

class MyDrawerPage extends ConsumerStatefulWidget {
  const MyDrawerPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyDrawerPageState();
}

class _MyDrawerPageState extends ConsumerState<MyDrawerPage> {
 
  List<String> countryList = [
    'Nigeria',
    'USA',
    'Help',
  ];
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    final _viewModel = ref.watch(categoryViewModel);
    return SafeArea(
      child: Drawer(
        elevation: 10,
        backgroundColor: AppColors.black,
        child: Container(
          width: 300,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              border:
                  Border(right: BorderSide(width: 0.4, color: AppColors.gray))),
          child: Stack(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Clafiya News',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.sync_alt,
                              size: 25.w,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: ListView(
                  children: [
                 const   Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Categories',
                        style: TextStyle(color: AppColors.white, fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            category.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: InkWell(
                                onTap: () {
 setState(() {
                          _viewModel.selectedIndex = index;
                        });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: _viewModel.selectedIndex == index
                                        ? AppColors.primary
                                        : AppColors.black,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 2),
                                    child: Text(
                                      category[index],
                                      style: TextStyle(
                                        color: _viewModel.selectedIndex == index
                                            ? AppColors.white
                                            : AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                    const Divider(
                      color: AppColors.gray,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
