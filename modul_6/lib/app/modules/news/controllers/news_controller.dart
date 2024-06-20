import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../../../data/models/news_api.dart';

class NewsController extends GetxController {
  String baseUrl =
      "https://newsapi.org/v2/top-headlines?country=id&apiKey=8849ce4f79484316bb3d4e00adfd54ef";
  var articles = <Article>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchNews() async {
    try {
      isLoading(true);
      final response = await get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> newsJson = json.decode(response.body)['articles'];
        articles.value =
            newsJson.map((json) => Article.fromJson(json)).toList();
      } else {
        errorMessage('Failed to load news');
      }
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<List<Article>> fetchArticles() async {
    try {
      isLoading.value = true; // Set loading state to true
      final response = await get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final jsonData = response.body;
        final articlesResult = ArticlesResult.fromJson(json.decode(jsonData));
        return articles.value = articlesResult.articles;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('An error occurred: $e');
      return [];
    } finally {
      isLoading.value = false; // Set loading state to false when done
    }
  }

  String formatPublishedAt(DateTime publishedAt) {
    final now = DateTime.now();
    final difference = now.difference(publishedAt);

    if (difference.inDays < 1) {
      return DateFormat.Hm().format(publishedAt); // format as HH:mm
    } else {
      return DateFormat('yyyy-MM-dd')
          .format(publishedAt); // format as yyyy-MM-dd
    }
  }
}
