import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:test_app/feature/models/gifpy_model.dart';

class HomeController extends GetxController {
  Dio dioClient = Dio();

  // Observables
  var isLoading = false.obs;
  var isMoreLoading = false.obs;

  String baseUrl = "https://api.giphy.com/v1/gifs";
  String apiKey = "wEZCMjyhtJTahqYrskmE3P6BGNcnaEvj";

  // Data
  RxList<GifModel> giphyData = <GifModel>[].obs;

  // Pagination
  int limit = 20;
  int offset = 0;

  // Searching
  String currentQuery = "";


  Future<void> fetchGifs({bool isLoadMore = false}) async {
    try {
      if (isLoadMore) {
        isMoreLoading.value = true;
      } else {
        isLoading.value = true;
        offset = 0;
        giphyData.clear();
      }

      String endpoint =
          currentQuery.isEmpty ? "/trending" : "/search";

      final res = await dioClient.get(
        "$baseUrl$endpoint",
        queryParameters: {
          "api_key": apiKey,
          "limit": limit,
          "offset": offset,
          if (currentQuery.isNotEmpty) "q": currentQuery,
          "rating": "g",
        },
      );

      if (res.statusCode == 200) {
        List<dynamic> data = res.data['data'];

        List<GifModel> mapped =
            data.map((e) => GifModel.fromJson(e)).toList();

        giphyData.addAll(mapped);
      }
    } catch (e) {
      print("API error: $e");
    } finally {
      isLoading.value = false;
      isMoreLoading.value = false;
    }
  }


  void searchGifs(String query) {
    currentQuery = query;
    fetchGifs();
  }


  void loadMore() {
    offset += limit;
    fetchGifs(isLoadMore: true);
  }

  @override
  void onInit() {
    fetchGifs();
    super.onInit();
  }
}
