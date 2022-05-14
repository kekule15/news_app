import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/models/news_response_model.dart';
import 'package:newsapp/styles/appColors.dart';
import 'package:newsapp/utils/strings.dart';
import 'package:newsapp/widgets/webview.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class NewsDetailsScreen extends ConsumerStatefulWidget {
  const NewsDetailsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends ConsumerState<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as Article;
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(0),
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: AppColors.gray,
                image: DecorationImage(
                    image: NetworkImage(
                        data.urlToImage == '' ? urlReplacer : data.urlToImage),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              data.title,
              style: const TextStyle(
                  color: AppColors.black, fontWeight: FontWeight.w600),
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Author: ${data.author == '' ? 'NA' : data.author}'),
            subtitle: Text(data.source!.name!),
            trailing: SizedBox(
              width: 100,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Share.share(data.url, subject: 'Clafiya News');
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                data.content,
                style: TextStyle(color: AppColors.termsTextColor),
              ),
              subtitle: InkWell(
                onTap: () {
                  Get.to(
                    () => WebViewSetting(
                      url: data.url,
                    ),
                  );
                },
                child: const Text(
                  'read more...',
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              DateFormat('d MMMM y')
                  .format(DateTime.tryParse(data.publishedAt!.toString())!),
              style: TextStyle(fontSize: 13, color: AppColors.gray),
            ),
          ),
        ],
      ),
    );
  }
}
