import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/providers/news_data_provider.dart';
import 'package:newsapp/styles/appColors.dart';
import 'package:newsapp/utils/news_category_list.dart';
import 'package:newsapp/utils/providers.dart';
import 'package:newsapp/views/home/drawer.dart';
import 'package:newsapp/views/home/news_details.dart';
import 'package:newsapp/widgets/news_card.dart';
import 'package:get/get.dart';
import 'package:newsapp/widgets/special_offers_preloader.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  void _openMyDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  int selected = 0;
  @override
  Widget build(BuildContext context) {
    final _viewModel = ref.watch(categoryViewModel);
    final _newsViewModel = ref.watch(newsDataRequestProvider);
    return Scaffold(
      key: _scaffoldKey,
      drawer: const MyDrawerPage(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  child: const Icon(
                    Icons.menu,
                    color: AppColors.black,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  'Clafiya News',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                fillColor: AppColors.unselectedTabIndicator,
                focusColor: AppColors.primary,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                        color: AppColors.unselectedTabIndicator)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                        color: AppColors.unselectedTabIndicator)),
                hintText: 'Search...',
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.termsTextColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 20),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: category.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
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
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            child: Text(
                              category[index],
                              style: TextStyle(
                                color: _viewModel.selectedIndex == index
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })),
          ),
          _newsViewModel.newsData.loading == true ||
                  _newsViewModel.newsData.data == null
              ? ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CustomLoader(
                        customWidth: MediaQuery.of(context).size.width,
                        customHeight: 220.0,
                        borderRadius: 10.0,
                      ),
                    );
                  })
              : _newsViewModel.newsData.data!.articles!.isEmpty == true
                  ? const Center(
                      child: Text('No fetched data'),
                    )
                  : ListView.builder(
                      itemCount: _newsViewModel.newsData.data!.articles!.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                        print(
                            'hello my list ${_newsViewModel.newsData.data!.articles!.length}');

                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: InkWell(
                              onTap: () {
                                Get.to(() => const NewsDetailsScreen());
                              },
                              child: NewsCardWidget(
                                title: _newsViewModel
                                    .newsData.data!.articles![index].title!,
                                sourceName: _newsViewModel.newsData.data!
                                    .articles![index].source!.name!,
                                date: DateFormat('d MMMM y').format(
                                    DateTime.tryParse(_newsViewModel.newsData
                                        .data!.articles![index].publishedAt!
                                        .toString())!),
                                image: _newsViewModel.newsData.data!
                                    .articles![index].urlToImage!,
                                description: '',
                              )),
                        );
                      }))
        ],
      ),
    );
  }
}
