import 'package:e2mars/export.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: Get.width,
          height: Get.height,
          color: Colors.white,
          child: Obx(
            () => AssetImageWidget(
              controller.currentImage.value,
              imageFitType:BoxFit.contain,
            ).paddingSymmetric(horizontal: 85.h),
          ),
        ));
  }
}
