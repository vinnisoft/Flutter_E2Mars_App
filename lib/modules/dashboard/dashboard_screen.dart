import 'package:e2mars/export.dart';

class DashboardScreen extends GetView<DashboardController> {
  DashboardScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          key: _scaffoldKey,
          drawer: DrawerWidget(),
          appBar: CustomAppBar(
            isBackIconVisible: false,
            leadingIcon: controller.selectedTab.value == 0 ? null : SizedBox(),
            appBarTitle:
                currentRole == "rider" && controller.selectedTab.value == 0
                    ? _appbarTitleRider()
                    : _appbarTitleDriver(),
            appBarTitleText: currentRole == "rider"
                ? _appbarTitleTextRider()
                : _appbarTitleTextDriver(),
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            actionWidget: [
              controller.selectedTab.value == 3 ?
                  AssetImageWidget(
                    AppImages.iconsEditProfile,
                    imageHeight: 20.h,
                    imageWidth: 20.h,
                  ).paddingSymmetric(horizontal: 15.h) : SizedBox()
            ],
          ),
          body: Obx(() => currentRole == "rider"
              ? controller.riderScreens[controller.selectedTab.value]
              : controller.driverScreens[controller.selectedTab.value]),
          bottomNavigationBar: _bottomAppBar()),
    );
  }

  _appbarTitleRider() {
    switch (controller.selectedTab.value) {
      case 0:
        return Transform.translate(
          offset: Offset(-30, 0),
          child: Obx(
            () => Row(
              children: [
                NetworkImageWidget(
                  imageUrl: "",
                  imageHeight: 45.h,
                  imageWidth: 45.h,
                  radiusAll: 45.h,
                ).paddingOnly(right: 12.h),
                Text(
                  '${controller.userData.value.firstName} ${controller.userData.value.lastName}',
                  style: textStyleHeadlineMedium()
                      .copyWith(fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        );
      case 1:
      case 2:
      case 3:
    }
    ;
  }

  _appbarTitleDriver() {
    switch (controller.selectedTab.value) {
      case 0:
        return Transform.translate(
          offset: Offset(-30, 0),
          child: Obx(
            () => Row(
              children: [
                NetworkImageWidget(
                  imageUrl: "",
                  imageHeight: 45.h,
                  imageWidth: 45.h,
                  radiusAll: 45.h,
                ).paddingOnly(right: 12.h),
                Text(
                  '${controller.userData.value.firstName} ${controller.userData.value.lastName}',
                  style: textStyleHeadlineMedium()
                      .copyWith(fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        );
      case 1:
      case 2:
      case 3:
        return null;
    }
    ;
  }

  _appbarTitleTextRider() {
    switch (controller.selectedTab.value) {
      case 0:
        return null;
      case 1:
      case 2:
      case 3:
    }
  }

  _appbarTitleTextDriver() {
    switch (controller.selectedTab.value) {
      case 0:
        return null;
      case 1:
      case 2:
      case 3:
        return keyProfile.tr;
    }
    ;
  }

  _bottomAppBar() => Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildIcon(AppImages.iconsHomeSelected,
                  AppImages.iconsHomeUnselected, 0),
              _buildIcon(AppImages.iconsMyRideSelected,
                  AppImages.iconsMyRideUnselected, 1),
              _buildIcon(AppImages.iconsHelpSelected,
                  AppImages.iconsHelpUnselected, 2),
              _buildIcon(AppImages.iconsProfileSelected,
                  AppImages.iconsProfileUnselected, 3),
            ],
          ).paddingOnly(bottom: 10.h),
        ),
      );

  Widget _buildIcon(activeIcon, icon, int index) {
    return GestureDetector(
      onTap: () {
        controller.selectedTab.value = index;
        switch (controller.selectedTab.value) {
          case 0:
            break;

          case 1:
            break;

          case 2:
            break;

          case 3:
            break;
        }
      },
      child: controller.selectedTab.value == index
          ? AssetImageWidget(
              activeIcon,
              imageHeight: 25.h,
            )
          : AssetImageWidget(
              icon,
              imageHeight: 25.h,
            ),
    );
  }
}
