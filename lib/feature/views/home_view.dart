import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/feature/controllers/home_controller.dart';
import 'package:test_app/utils/text_fields/text_field.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("GIF's", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            TTextField(hintText: 'Search...',
            onChanged: controller.searchGifs,
            ),

            SizedBox(height: 24),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                if (controller.giphyData.isEmpty) {
                  return Center(child: Text("No Data"));
                }

                return NotificationListener<ScrollNotification>(
                  onNotification: (scroll) {
                    if (!controller.isMoreLoading.value &&
                        scroll.metrics.pixels ==
                            scroll.metrics.maxScrollExtent) {
                      controller.loadMore();
                    }
                    return true;
                  },
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),

                    itemCount: controller.giphyData.length,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = controller.giphyData[index];
                      return Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(11),
                          child: Image.network(data.url, fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
