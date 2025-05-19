import 'package:e2mars/export.dart';

class RoleSelectionScreen extends GetView<RoleSelectionController> {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssetImageWidget(
            AppImages.iconsAppLogo,
            imageHeight: 60.h,
          ),
          Text(
            keyChooseTheProfile.tr,
            textAlign: TextAlign.center,
            style: textStyleDisplayLarge(),
          ).paddingOnly(top:60.h, left: 20.h, right: 20.h, bottom: 20.h),
          _riderRole(),
          _driverRole(),
          CustomButtonWidget(buttonText: keyContinue.tr, onPressed: () {
            controller.onContinue();
          }).paddingOnly(top: 30.h)
        ],
      ).paddingSymmetric(horizontal: 20.h, vertical: 30.h),
    );
  }

  _riderRole() => InkWell(
        onTap: () {
          controller.role.value = "rider";
        },
        child: Obx(
          () => Container(
            margin: EdgeInsets.only(top: 30.h, bottom: 15.h),
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.h),
            decoration: BoxDecoration(
                color: controller.role.value == "rider"
                    ? AppColors.blackColor
                    : AppColors.greyColor,
                borderRadius: BorderRadius.circular(25.r)),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(18.h),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: AssetImageWidget(
                        AppImages.iconsRider,
                        imageHeight: 22.h,
                      ),
                    ),
                    SizedBox(
                      width: 12.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          keyRider.tr,
                          style: textStyleDisplayMedium().copyWith(
                              color: controller.role.value == "rider"
                                  ? Colors.white
                                  : AppColors.primaryTextColor),
                        ),
                        Text(
                          keyContinueAsRider.tr,
                          style: textStyleBodyMedium().copyWith(
                              color: controller.role.value == "rider"
                                  ? Colors.white
                                  : AppColors.primaryTextColor),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  height: 15.h,
                  width: 15.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: controller.role.value == "rider"
                              ? AppColors.appColor
                              : Colors.black)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: controller.role.value == "rider"
                          ? AppColors.appColor
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ).paddingAll(3.h),
                )
              ],
            ),
          ),
        ),
      );

  _driverRole() => InkWell(
        onTap: () {
          controller.role.value = "driver";
        },
        child: Obx(
          () => Container(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.h),
            decoration: BoxDecoration(
                color: controller.role.value == "driver"
                    ? AppColors.blackColor
                    : AppColors.greyColor,
                borderRadius: BorderRadius.circular(25.r)),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12.h),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: AssetImageWidget(
                        AppImages.iconsDriver,
                        imageHeight: 28.h,
                      ),
                    ),
                    SizedBox(
                      width: 12.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          keyDriver.tr,
                          style: textStyleDisplayMedium().copyWith(
                              color: controller.role.value == "driver"
                                  ? Colors.white
                                  : AppColors.primaryTextColor),
                        ),
                        Text(
                          keyContinueAsDriver.tr,
                          style: textStyleBodyMedium().copyWith(
                              color: controller.role.value == "driver"
                                  ? Colors.white
                                  : AppColors.primaryTextColor),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  height: 15.h,
                  width: 15.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: controller.role.value == "driver"
                              ? AppColors.appColor
                              : Colors.black)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: controller.role.value == "driver"
                          ? AppColors.appColor
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ).paddingAll(3.h),
                )
              ],
            ),
          ),
        ),
      );
}
