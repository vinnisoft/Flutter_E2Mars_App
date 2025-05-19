import 'package:e2mars/export.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        dividerTheme: const DividerThemeData(color: Colors.transparent),
      ),
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: (){
                  Get.back();
                },
                child: AssetImageWidget(
                  AppImages.iconsClose,
                  imageHeight: 10.h,
                  imageFitType: BoxFit.contain,
                ).paddingSymmetric(vertical: 10.h, horizontal: 15.h),
              ),
            ),
            Text(
              keyMenu.tr,
              style: textStyleHeadlineLarge(),
            ).paddingSymmetric(horizontal: 10.h),
            SizedBox(
              height: 22.h,
            ),
            _drawerItem(
                onPress: () {
                  Get.back();
                },
                icon: AppImages.iconsHome,
                label: keyHome.tr),
             _drawerItem(
                onPress: () {},
                icon: AppImages.iconsMyRide,
                label: keyMyRide.tr),
            currentRole == "rider" ? _drawerItem(
                onPress: () {},
                icon: AppImages.iconsE2Safe,
                label: keyE2Safe.tr) : _drawerItem(
                onPress: () {},
                icon: AppImages.iconsActiveRide,
                label: keyActiveRide.tr),
            _drawerItem(
                onPress: () {
                  Get.toNamed(AppRoutes.routeE2Refer);
                },
                icon: AppImages.iconsE2Refer,
                label: keyE2Refer.tr),
            currentRole == "rider" ? _drawerItem(
                onPress: () {},
                icon: AppImages.iconsE2Pricing,
                label: keyE2Pricing.tr) : SizedBox(),
            _drawerItem(
                onPress: () {},
                icon: AppImages.iconsProfile,
                label: keyProfile.tr),
            currentRole == "rider" ? _drawerItem(
                onPress: () {},
                icon: AppImages.iconsE2Wallet,
                label: keyE2Wallet.tr) : _drawerItem(
                onPress: () {},
                icon: AppImages.iconsE2earnings,
                label: keyE2Earnings.tr),
            _drawerItem(
                onPress: () {},
                icon: AppImages.iconsSetting,
                label: keySettings.tr),
            currentRole == "rider" ? _drawerItem(
                onPress: () {},
                icon: AppImages.iconsE2Bot,
                label: keyE2Bot.tr) : SizedBox(),
            _drawerItem(
                onPress: () {},
                icon: AppImages.iconsHelp,
                label: keyHelp.tr),
            InkWell(
              onTap: (){
                _logoutBottomSheet();
              },
              child: Row(
                children: [
                  AssetImageWidget(
                    AppImages.iconsLogout,
                    imageHeight: 18.h,
                    imageWidth: 18.h,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: Text(
                      keyLogout.tr,
                      style: textStyleHeadlineMedium().copyWith(
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  )
                ],
              ).paddingOnly(top:  currentRole == "rider" ? 50.h : 100.h, left: 18.h,),
            )
              ],
            ).paddingSymmetric(horizontal: 16.h, vertical: 25.h),
      ),
    );
  }

  _drawerItem({onPress, icon, label}) => InkWell(
        onTap: onPress,
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 2.h),
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
            child: Row(
              children: [
                AssetImageWidget(
                  icon,
                  imageHeight: 25.h,
                  imageWidth: 25.h,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Expanded(
                  child: Text(
                    label,
                    style: textStyleHeadlineMedium().copyWith(
                      fontWeight: FontWeight.w400
                    ),
                  ),
                )
              ],
            )),
      );

  _logoutBottomSheet() => Get.bottomSheet(Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(keySureToLogoutAccount.tr, style: textStyleLabelLarge()).paddingOnly(bottom: 20.h),
      Row(
        children: [
          Expanded(
              child: CustomButtonWidget(
                  // isLoading: controller.logoutLoading,
                  buttonText: keyLogout.tr, onPressed: () {
                // controller.logout();
                Get.offAllNamed(AppRoutes.routeRoleSelection);
                Get.find<LocalStorage>().clearLoginData();
              })),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: CustomButtonWidget(
                  buttonText: keyCancel.tr,
                  isOutlined: true,
  outlineColor: AppColors.secondaryTextColor,
                  onPressed: () {
                    Get.back();
                  })),
        ],
      )
    ],
  ).paddingSymmetric(vertical: 20.h, horizontal: 15.h),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(12.r),
          topLeft:  Radius.circular(12.r)
      ),
    ),
    backgroundColor: Colors.white,
  );
}
