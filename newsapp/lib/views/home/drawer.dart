import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/styles/appColors.dart';

class MyDrawerPage extends ConsumerStatefulWidget {
  const MyDrawerPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyDrawerPageState();
}

class _MyDrawerPageState extends ConsumerState<MyDrawerPage> {
  List<String> movieTypes = [
    'TV Shows',
    'Action',
    'Romance',
    'Thrillers',
    'Sci-Fi & Fantancy',
    'Dramas',
    'Comedies',
    'Family',
  ];
  List<String> subs = [
    'Settings',
    'Account',
    'Help',
  ];
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
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
                height: 150,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Clafiya',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: AppColors.white),
                          ),
                          const SizedBox(
                            width: 100,
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
                          // InkWell(
                          //   onTap: () {
                          //     Get.to(() => const SettingsPage());
                          //   },
                          //   child: Icon(
                          //     Icons.settings,
                          //     size: 25.w,
                          //     color: AppColors.white,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            movieTypes.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  movieTypes[index],
                                  style: TextStyle(
                                      color: AppColors.white, fontSize: 13.sp),
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
