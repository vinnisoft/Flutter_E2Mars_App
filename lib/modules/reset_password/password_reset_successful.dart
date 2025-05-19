import 'package:e2mars/export.dart';

class PasswordResetSuccessful extends StatelessWidget{
  const PasswordResetSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssetImageWidget(
              AppImages.iconsPasswordResetSuccess,
              imageHeight: 100.h,
            ),
            Text(
              keyPasswordChanged.tr,
              style: textStyleHeadlineLarge(),
            ).paddingOnly(top: 10.h, bottom: 4.h,),
            Text(
              keyPasswordChangedDesc.tr,
              textAlign: TextAlign.center,
              style: textStyleTitleSmall(),
            ).paddingOnly(bottom: 5.h,  left: 30.h, right: 30.h),
            _backToSignInButton(),
          ],
        ).paddingOnly(bottom: 40.h, left: 25.h, right:25.h));
  }


  _backToSignInButton() => CustomButtonWidget(
    onPressed: () {
      Get.offAllNamed(AppRoutes.routeLogin);
    },
    buttonText: keyBackToLogin.tr,
  ).paddingOnly(top: 15.h);
}
