import 'package:get/get.dart';
import 'package:test_app/feature/views/home_view.dart';

class SplashController  extends GetxController{

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3),(){
      Get.offAll(()=>HomeView());
    });
    super.onInit();
  }
}