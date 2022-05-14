import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/providers/news_data_provider.dart';
import 'package:newsapp/styles/appColors.dart';
import 'package:newsapp/utils/country_category_list.dart';
import 'package:newsapp/utils/providers.dart';
import 'package:newsapp/utils/news_category_list.dart';

class MyDrawerPage extends ConsumerStatefulWidget {
  const MyDrawerPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyDrawerPageState();
}

class _MyDrawerPageState extends ConsumerState<MyDrawerPage> {
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(categoryViewModel);
    final newsViewModel = ref.watch(newsDataRequestProvider);
    final countryViewModel = ref.watch(countryListViewModel);
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                                    viewModel.selectedIndex = index;
                                  });
                                  switch (index) {
                                    case 0:
                                      ref
                                          .watch(categoryViewModel)
                                          .categoryCode = 'general';
                                      newsViewModel.getNewsData();
                                      break;
                                    case 1:
                                      ref
                                          .watch(categoryViewModel)
                                          .categoryCode = 'business';
                                      newsViewModel.getNewsData();
                                      break;
                                    case 2:
                                      ref
                                          .watch(categoryViewModel)
                                          .categoryCode = 'entertainment';
                                      newsViewModel.getNewsData();
                                      break;
                                    case 3:
                                      ref
                                          .watch(categoryViewModel)
                                          .categoryCode = 'health';
                                      newsViewModel.getNewsData();
                                      break;
                                    case 4:
                                      ref
                                          .watch(categoryViewModel)
                                          .categoryCode = 'science';
                                      newsViewModel.getNewsData();
                                      break;
                                    case 5:
                                      ref
                                          .watch(categoryViewModel)
                                          .categoryCode = 'sports';
                                      newsViewModel.getNewsData();
                                      break;
                                    case 6:
                                      ref
                                          .watch(categoryViewModel)
                                          .categoryCode = 'technology';
                                      newsViewModel.getNewsData();
                                      break;
                                    default:
                                      ref
                                          .watch(categoryViewModel)
                                          .categoryCode = 'general';
                                      newsViewModel.getNewsData();
                                      break;
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: viewModel.selectedIndex == index
                                        ? AppColors.primary
                                        : AppColors.black,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 5, 130, 5),
                                    child: Text(
                                      category[index],
                                      style: TextStyle(
                                        color: viewModel.selectedIndex == index
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Available Countries',
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
                            countryList.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    countryViewModel.selectedIndex = index;
                                  });
                                  switch (index) {
                                    case 0:
                                      ref
                                          .watch(countryListViewModel)
                                          .selectedcountryCode = 'au';
                                      newsViewModel.getNewsData();
                                      countryViewModel.selectedcountry =
                                          'Australia';
                                      break;
                                    case 1:
                                      ref
                                          .watch(countryListViewModel)
                                          .selectedcountryCode = 'ng';
                                      newsViewModel.getNewsData();
                                      countryViewModel.selectedcountry =
                                          'Nigeria';
                                      break;
                                    case 2:
                                      ref
                                          .watch(countryListViewModel)
                                          .selectedcountryCode = 'sa';
                                      newsViewModel.getNewsData();
                                      countryViewModel.selectedcountry =
                                          'South Africa';
                                      break;
                                    case 3:
                                      ref
                                          .watch(countryListViewModel)
                                          .selectedcountryCode = 'ch';
                                      newsViewModel.getNewsData();
                                      countryViewModel.selectedcountry =
                                          'Switzerland';
                                      break;
                                    case 4:
                                      ref
                                          .watch(countryListViewModel)
                                          .selectedcountryCode = 'gb';
                                      newsViewModel.getNewsData();
                                      countryViewModel.selectedcountry =
                                          'United Kingdom';
                                      break;
                                    case 5:
                                      ref
                                          .watch(countryListViewModel)
                                          .selectedcountryCode = 'us';
                                      newsViewModel.getNewsData();
                                      countryViewModel.selectedcountry = 'USA';
                                      break;

                                    default:
                                      ref
                                          .watch(countryListViewModel)
                                          .selectedcountryCode = 'ng';
                                      newsViewModel.getNewsData();
                                      countryViewModel.selectedcountry =
                                          'Nigeria';
                                      break;
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        countryViewModel.selectedIndex == index
                                            ? AppColors.primary
                                            : AppColors.black,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 5, 130, 5),
                                    child: Text(
                                      countryList[index],
                                      style: TextStyle(
                                        color: countryViewModel.selectedIndex ==
                                                index
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
