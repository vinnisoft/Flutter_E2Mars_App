import 'package:e2mars/export.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _appLogo(),
                      Text(
                        keyLoginToContinue.tr,
                        style: textStyleHeadlineLarge(),
                      ).paddingOnly(top: 30.h, bottom: 4.h),
                      Text(
                        keyLoginToContinueDesc.tr,
                        style: textStyleTitleSmall(),
                      ).paddingOnly(bottom: 5.h),
                      _form(),
                      _forgotPassword(),
                      _loginButton(),
                    ],
                  ).paddingSymmetric(horizontal: 22.w),
                ),
                _noAccount()
              ],
            ),
          ),
        ));
  }

  _appLogo() => Align(
    alignment: Alignment.center,
    child: AssetImageWidget(
          AppImages.iconsAppLogo,
          imageHeight: 60.h,
        ).paddingOnly(top: 70.h, bottom: 10.h),
  );

  _form() => Form(
      key: _loginFormKey,
      child: Column(
        children: [
          TextFieldWidget(
            textController: controller.emailTextController,
            focusNode: controller.emailFocusNode,
            label: keyEmail.tr,
            validate: (value) => EmailValidator.validateEmail(value ?? ''),
          ).paddingSymmetric(vertical: 6.h),
          Obx(
            () => TextFieldWidget(
              textController: controller.passwordTextController,
              focusNode: controller.passwordFocusNode,
              label: keyPassword.tr,
              obscureText: controller.viewPassword.value,
              validate: (value) =>
                  FieldChecker.fieldChecker(value: value ?? '',message: keyPassword.tr ),
              maxLength: 16,
              suffixIcon: InkWell(
                onTap: () => controller.viewPassword.value =
                    !controller.viewPassword.value,
                child: AssetImageWidget(
                  controller.viewPassword.value
                      ? AppImages.iconsHidePassword
                      : AppImages.iconsShowPassword,
                  imageHeight: 10.h,
                ).paddingSymmetric(vertical: 9.h, horizontal: 14.w),
              ),
            ).paddingSymmetric(vertical: 6.h),
          )
        ],
      ));

  _forgotPassword() => Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.routeForgotPassword);
          },
          child: Text("${keyForgotPassword.tr}?",
              style: textStyleLabelSmall()),
        ),
      ).paddingOnly(top: 2.h, bottom: 14.h);

  _loginButton() => CustomButtonWidget(
        onPressed: () {
          if (_loginFormKey.currentState!.validate()) {
            controller.loginApi();
          }
        },
        isLoading: controller.loginLoading,
        buttonText: keyLogin.tr,
      ).paddingSymmetric(vertical: 10.h);

  _noAccount() => Text.rich(
   TextSpan(
     text: keyNoAccount.tr,
     style: textStyleTitleMedium().copyWith(
       color: AppColors.secondaryTextColor
     ),
     children: [
       TextSpan(
         text: keySignup.tr,
         recognizer: TapGestureRecognizer()..onTap = (){
           Get.toNamed(AppRoutes.routeSignup);
         },
         style: textStyleTitleMedium().copyWith(
           color: AppColors.secondaryAppColor,
           fontWeight: FontWeight.w600
         )
       )
     ]
   ),
  ).paddingSymmetric(vertical: 20.h);
}
