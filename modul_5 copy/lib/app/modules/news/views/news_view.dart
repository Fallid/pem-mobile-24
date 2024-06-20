import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_2/app/modules/news/controllers/news_controller.dart';
import 'package:modul_2/app/utils/resources.dart';
import 'package:modul_2/app/utils/text_style.dart';
import 'package:sizer/sizer.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Resources.color.primaryColor1,
        title: Text(
          'Headline News',
          style: StyleText.appBarTitle,
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Text(controller.errorMessage.value),
          );
        } else {
          return ListView.builder(
            itemCount: controller.articles.length,
            itemBuilder: (context, index) {
              final article = controller.articles[index];
              final formatDate =
                  controller.formatPublishedAt(article.publishedAt);
              return Card(
                  surfaceTintColor: Resources.color.whiteColor,
                  shadowColor: Resources.color.hintColor,
                  borderOnForeground: false,
                  elevation: 4.0,
                  color: Resources.color.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  Icons.date_range_outlined,
                                  color: Resources.color.hintColor,
                                ),
                                Text(
                                  formatDate,
                                  style: TextStyle(
                                      color: Resources.color.hintColor),
                                ),
                              ],
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Resources.color.hintColor,
                                ),
                                SizedBox(
                                  width: 15.w,
                                  child: Text(
                                    article.author,
                                    style: TextStyle(
                                        color: Resources.color.hintColor),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          article.title,
                          style: TextStyle(
                              fontFamily: Resources.font.primaryFont,
                              fontSize: 12.sp),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          article.description ?? 'No description',
                          style: TextStyle(
                              color: Resources.color.subtitleColor,
                              fontSize: 10.sp),
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                  ));
              // ListTile(
              //   title: Text(article.title),
              //   subtitle: Text(article.description ?? 'No description'),
              // );
            },
          );
        }
      }),
    );
  }
}
