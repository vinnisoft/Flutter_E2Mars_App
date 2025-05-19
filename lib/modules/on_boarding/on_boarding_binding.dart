import 'package:e2mars/export.dart';

class OnBoardingBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<OnBoardingController>(
      () => OnBoardingController(),
    );
  }
}
