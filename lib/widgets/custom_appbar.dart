

import 'package:e2mars/export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? appBarTitleText;
  final List<Widget>? actionWidget;
  final Widget? appBarTitle;
  final Color? bgColor;
  final Color? backIconColor;
  final bool? isBackIconVisible;
  final bool? isAuthentication;
  final Function? onTap;
  final Widget? leadingIcon;


  const CustomAppBar({
    super.key,
    this.appBarTitleText,
    this.appBarTitle,
    this.onTap,
    this.actionWidget,
    this.isBackIconVisible = true,
    this.isAuthentication = false,
    this.backIconColor,
    this.bgColor,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60.h,
      leadingWidth: 60.h,
      leading: leadingIcon ?? ((isBackIconVisible ?? true) ? _backIcon() : _menuIcon()),
      centerTitle: true,
      title: appBarTitle ?? (appBarTitleText != "" || appBarTitleText != null
          ? Text(
        appBarTitleText ?? "",
        textAlign: TextAlign.center,
        style: textStyleHeadlineLarge().copyWith(
          fontSize: 18.h
        ),
      ).paddingOnly(top: 10.h, bottom: 10.h) : SizedBox(height: 0, width: 0,)),
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r)
      ),
      scrolledUnderElevation: 0.0,
      elevation: 0,
      backgroundColor: bgColor ?? Colors.transparent,
      actions:  actionWidget ?? [],
    );
  }

  _backIcon() {
    return InkWell(
      child: AssetImageWidget(
        AppImages.iconsBack,
        color: backIconColor,
        imageHeight: 15.h,
      ).paddingSymmetric(vertical: 5.h),
      onTap: () {
        if (onTap == null) {
          Get.back(result: true);
        } else {
          onTap!();
        }
      },
    );
  }

  _menuIcon() {
    return InkWell(
      child: AssetImageWidget(
        AppImages.iconsMenu,
        color: backIconColor,
        imageHeight: 15.h,
      ).paddingSymmetric(vertical: 14.h),
      onTap: () {
        if (onTap == null) {
          Get.back(result: true);
        } else {
          onTap!();
        }
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
