import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/models/news_response_model.dart';
import 'package:newsapp/providers/news_data_provider.dart';
import 'package:newsapp/providers/providers.dart';
import 'package:newsapp/styles/appColors.dart';
import 'package:newsapp/utils/news_category_list.dart';
import 'package:newsapp/utils/strings.dart';
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

  TextEditingController controller = TextEditingController();

  List<Article> _foundUsers = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newsViewModel = ref.watch(newsDataRequestProvider);
    if (newsViewModel.newsData.data != null) {
      _foundUsers = newsViewModel.newsData.data!.articles!;
    }
  }

  int selected = 0;
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(categoryViewModel);
    final newsViewModel = ref.watch(newsDataRequestProvider);
    final countryViewModel = ref.watch(countryListViewModel);
    if (newsViewModel.newsData.data != null) {
      _foundUsers = newsViewModel.newsData.data!.articles!;
    }
    // This function is called whenever the text field changes
    void _runFilter(String enteredKeyword) {
      final newsViewModel = ref.watch(newsDataRequestProvider);
      final results = newsViewModel.newsData.data!.articles!.where((user) {
        final sourceName = user.source!.name!.toLowerCase();
        final input = enteredKeyword.toLowerCase();
        return sourceName.contains(input);
      }).toList();
      setState(() {
        _foundUsers = results;
      });
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'Clafiya News',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.black),
        ),
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: const Icon(
            Icons.menu,
            color: AppColors.black,
            size: 25,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                newsViewModel.getNewsData();
              },
              child: const Icon(
                Icons.refresh,
                color: AppColors.black,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      drawer: const MyDrawerPage(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              countryViewModel.selectedcountry,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: controller,
              onChanged: _runFilter,
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
                          viewModel.selectedIndex = index;
                        });
                        switch (index) {
                          case 0:
                            ref.watch(categoryViewModel).categoryCode =
                                'general';
                            newsViewModel.getNewsData();
                            break;
                          case 1:
                            ref.watch(categoryViewModel).categoryCode =
                                'business';
                            newsViewModel.getNewsData();
                            break;
                          case 2:
                            ref.watch(categoryViewModel).categoryCode =
                                'entertainment';
                            newsViewModel.getNewsData();
                            break;
                          case 3:
                            ref.watch(categoryViewModel).categoryCode =
                                'health';
                            newsViewModel.getNewsData();
                            break;
                          case 4:
                            ref.watch(categoryViewModel).categoryCode =
                                'science';
                            newsViewModel.getNewsData();
                            break;
                          case 5:
                            ref.watch(categoryViewModel).categoryCode =
                                'sports';
                            newsViewModel.getNewsData();
                            break;
                          case 6:
                            ref.watch(categoryViewModel).categoryCode =
                                'technology';
                            newsViewModel.getNewsData();
                            break;
                          default:
                            ref.watch(categoryViewModel).categoryCode =
                                'general';
                            newsViewModel.getNewsData();
                            break;
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: viewModel.selectedIndex == index
                              ? AppColors.primary
                              : AppColors.white,
                          border: viewModel.selectedIndex != index
                              ? Border.all(color: AppColors.gray)
                              : null,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            child: Text(
                              category[index],
                              style: TextStyle(
                                color: viewModel.selectedIndex == index
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
          newsViewModel.newsData.loading == true ||
                  newsViewModel.newsData.data == null
              ? CustomLoader()
              : newsViewModel.newsData.data!.articles!.isEmpty == true
                  ? const Center(
                      child: Text('No fetched data'),
                    )
                  : _foundUsers.isNotEmpty
                      ? ListView.builder(
                          itemCount: _foundUsers.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: InkWell(
                                  onTap: () {
                                    Get.to(() => const NewsDetailsScreen(),
                                        arguments: newsViewModel
                                            .newsData.data!.articles![index]);
                                  },
                                  child: NewsCardWidget(
                                    title: _foundUsers[index].title!,
                                    sourceName:
                                        _foundUsers[index].source!.name!,
                                    date: DateFormat('d MMMM y').format(
                                        DateTime.tryParse(_foundUsers[index]
                                            .publishedAt!
                                            .toString())!),
                                    image: _foundUsers[index].urlToImage == ''
                                        ? urlReplacer
                                        : _foundUsers[index].urlToImage,
                                    description: '',
                                    url: _foundUsers[index].url!,
                                  )),
                            );
                          }))
                      : const Text(
                          'No results found',
                          style: TextStyle(fontSize: 24),
                        ),
        ],
      ),
    );
  }
}
