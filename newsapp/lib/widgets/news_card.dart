import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/styles/appColors.dart';
import 'package:newsapp/utils/providers.dart';
import 'package:share_plus/share_plus.dart';

class NewsCardWidget extends ConsumerStatefulWidget {
  final String title;
  final String description;
  final String date;
  final String image;
  final String sourceName;
  final String url;

  NewsCardWidget(
      {required this.title,
      required this.description,
      required this.date,
      required this.image,
      required this.sourceName,
      required this.url
      });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsCardWidgetState();
}

class _NewsCardWidgetState extends ConsumerState<NewsCardWidget> {
  bool selected = false;

  @override
  Widget build(
    BuildContext context,
  ) {
    bool isFavourite = ref.watch(mychecker);
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
                  image: NetworkImage(widget.image), fit: BoxFit.cover)),
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
            widget.title,
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
            widget.sourceName,
            style: const TextStyle(fontSize: 15),
          ),
          subtitle: Text(
            widget.date,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          trailing: SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                    // final isObs = ref.watch(mychecker.state);
                    // isObs.state = !isObs.state;
                  },
                  child: Stack(
                    children: [
                      const Icon(
                        Icons.favorite_border,
                      ),
                      Visibility(
                        visible: selected,
                        child: const Icon(
                          Icons.favorite,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    Share.share(widget.url, subject: 'Clafiya News');
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.gray.withOpacity(0.3),
                    child: const Icon(
                      Icons.share,
                      color: AppColors.black,
                    ),
                  ),
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
