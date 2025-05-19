import 'package:e2mars/export.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body:  Stack(
          children: [
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: PageView.builder(
                  onPageChanged: (value) {
                    controller.onSwipePage(value);
                  },
                  controller: controller.pageController,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) => Column(
                    children: [
                      AssetImageWidget(
                       currentRole == "rider" ? controller.riderData[index]["imageUrl"] : controller.driverData[index]["imageUrl"],
                        imageHeight: Get.height * 0.6,
                        imageFitType: BoxFit.cover,
                      ),
                      Text(
                        currentRole == "rider" ? controller.riderData[index]["headingText"] : controller.driverData[index]["headingText"],
                        style: textStyleDisplayLarge(),
                        textAlign: TextAlign.center,
                      ).paddingOnly(top: 35.h),
                      Text(
                        currentRole == "rider" ? controller.riderData[index]["bodyText"] :  controller.driverData[index]["bodyText"],
                        style: textStyleTitleSmall()
                            .copyWith(color: AppColors.secondaryTextColor),
                        textAlign: TextAlign.center,
                      ).paddingOnly(top: 6.h, left: 30.h, right: 30.h),
                    ],
                  ),
                ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(()=> controller.selectedPageIndex.value == 2  ? SizedBox() : Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.routeLogin);
                      },
                      child: Text(
                        keySkip.tr,
                        style:
                        textStyleTitleLarge().copyWith(color: Colors.white),
                      ).paddingSymmetric(horizontal: 10.h, vertical: 45.h),
                    ),
                  ),
                ),
               Column(
                 children: [
                   _indicatorWidget(),
                   SizedBox(height: 40.h,),
                   _nextSkipButton(),
                 ],
               )
              ],
            )
          ],
        ),
        );
  }

  Widget _indicatorWidget() => Container(
    alignment: Alignment.center,
    child: SmoothPageIndicator(
      controller: controller.pageController,
      count: 3,
      effect: ScrollingDotsEffect(
          dotHeight: 4.5.h,
          dotWidth: 5.w,
          spacing: 12.w,
          activeDotScale: 2,
          // expansionFactor: 1.3,
          activeDotColor: AppColors.secondaryAppColor,
          dotColor: AppColors.secondaryTextColor),
    ),
  );

  Widget _nextSkipButton() => Obx(()=> Row(
          children: [
            controller.selectedPageIndex.value == 0 ? SizedBox() : Expanded(
              child: CustomButtonWidget(
                  onPressed: () {
                    controller.movePageActionBack();
                  },
                  isOutlined: true,
                  outlineColor: AppColors.secondaryTextColor,
                  buttonText: keyBack.tr,
              ),
            ),
            SizedBox(
              width: controller.selectedPageIndex.value == 0
                  ? 0.w
                  : 20.w,
            ),
            Expanded(
              child: CustomButtonWidget(
                  onPressed: () {
                    controller.movePageAction();
                  },
                  buttonText: controller.selectedPageIndex.value ==
                          2
                      ? keyGetStarted.tr
                      : keyNext.tr,
                  ),
            ),
          ],
        ).paddingSymmetric(vertical: 20.h, horizontal: 30.h),
  );
}
