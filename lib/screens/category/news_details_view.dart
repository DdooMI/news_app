import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/news_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher_string.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key});
  static const String routeName = "news details";

  @override
  Widget build(BuildContext context) {
    Articles news = ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
            )),
        title: Text(news.author ?? "News App"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            Image.network(
              news.urlToImage ?? "",
              height: 230.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Text(
                news.author ?? "",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 15.sp),
              ),
            ),
            Text(news.title ?? "",
                style: Theme.of(context).textTheme.titleSmall),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('''${news.content}''',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 18.sp)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Text(
                      timeago.format(DateTime.parse(news.publishedAt ?? "")),
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 15.sp)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: InkWell(
                    onTap: () async {
                      String webUrl = news.url ?? 'https://flutter.dev';
                      if (await canLaunchUrlString(webUrl)) {
                        launchUrlString(webUrl,
                            mode: LaunchMode.externalApplication);
                      } else {
                        print("Can't launch $webUrl");
                      }
                    },
                    child: Text("complete article",
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
