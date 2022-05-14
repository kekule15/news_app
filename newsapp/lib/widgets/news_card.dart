import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/styles/appColors.dart';

class NewsCardWidget extends ConsumerWidget {
  const NewsCardWidget({Key? key}) : super(key: key);

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
              color: AppColors.gray.withOpacity(0.4)),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          horizontalTitleGap: 0,
          title: Text(
            'Google announces Flutter 3, now with macOS and Linus desktop suport',
            style:
                TextStyle(color: AppColors.black, fontWeight: FontWeight.w500),
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
          contentPadding: EdgeInsets.all(0),
          title: const Text(
            'Level up Coding',
            style: TextStyle(fontSize: 15),
          ),
          subtitle: const Text(
            '2022:04:23',
            style: TextStyle(
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
    const  Divider(
        color: AppColors.gray,
      )
    ]);
  }
}
