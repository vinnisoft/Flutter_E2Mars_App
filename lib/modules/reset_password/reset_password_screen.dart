import 'package:e2mars/export.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  ResetPasswordScreen({super.key});

  final _createNewPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body:Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              keyCreateNewPassword.tr,
              style: textStyleHeadlineLarge(),
            ).paddingOnly(top: 30.h, bottom: 4.h),
            Text(
              keyCreateNewPasswordDesc.tr,
              style: textStyleTitleSmall(),
            ).paddingOnly(bottom: 10.h),
            _form(),
            _resetPasswordButton(),
          ],
        ).paddingSymmetric(horizontal: 22.w));
  }

  _form() => Form(
      key: _createNewPasswordFormKey,
      child: Column(
        children: [
          Obx(
            () => TextFieldWidget(
              textController: controller.passwordTextController,
              focusNode: controller.passwordFocusNode,
              label: keyPassword.tr,
              obscureText: controller.viewPassword.value,
              validate: (value) =>
                  PasswordFormValidator.validateNewPassword(value ?? ''),
              maxLength: 16,
              suffixIcon: InkWell(
                onTap: () => controller.viewPassword.value =
                    !controller.viewPassword.value,
                child: AssetImageWidget(
                  controller.viewPassword.value
                      ? AppImages.iconsHidePassword
                      : AppImages.iconsShowPassword,
                  imageHeight: 12.h,
                ).paddingSymmetric(vertical: 9.h, horizontal: 14.w),
              ),
            ).paddingSymmetric(vertical: 6.h),
          ),
          Obx(
            () => TextFieldWidget(
              textController: controller.confirmPasswordTextController,
              focusNode: controller.confirmPasswordFocusNode,
              label: keyConfirmPassword.tr,
              obscureText: controller.viewConfirmPassword.value,
              validate: (value) =>
                  PasswordFormValidator.validateConfirmPassword(
                      value: value ?? '',
                      password: controller.passwordTextController.text.trim()),
              maxLength: 16,
              suffixIcon: InkWell(
                onTap: () => controller.viewConfirmPassword.value =
                    !controller.viewConfirmPassword.value,
                child: AssetImageWidget(
                  controller.viewConfirmPassword.value
                      ? AppImages.iconsHidePassword
                      : AppImages.iconsShowPassword,
                  imageHeight: 12.h,
                ).paddingSymmetric(vertical: 9.h, horizontal: 14.w),
              ),
            ).paddingSymmetric(vertical: 6.h),
          )
        ],
      ));

  _resetPasswordButton() => CustomButtonWidget(
        onPressed: () {
          if (_createNewPasswordFormKey.currentState!.validate()) {
            controller.resetPasswordApi();
          }
        },
        isLoading: controller.resetPasswordLoading,
        buttonText: keyResetPassword.tr,
      ).paddingOnly(top: 14.h);

}
