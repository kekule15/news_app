import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/styles/appColors.dart';

class NewsCardWidget extends ConsumerWidget {
  final String title;
  final String description;
  final String date;
  final String image;
  final String sourceName;

  NewsCardWidget(
      {required this.title,
      required this.description,
      required this.date,
      required this.image,
      required this.sourceName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.gray.withOpacity(0.3),
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover)),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          horizontalTitleGap: 0,
          title: Text(
            title,
            style: const TextStyle(
                color: AppColors.black, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListTile(
          horizontalTitleGap: 5,
          minLeadingWidth: 0,
          minVerticalPadding: 0,
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            sourceName,
            style: const TextStyle(fontSize: 15),
          ),
          subtitle: Text(
            date,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          trailing: SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  Icons.favorite_border,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.share,
                )
              ],
            ),
          ),
        ),
      ),
      const Divider(
        color: AppColors.gray,
      )
    ]);
  }
}
