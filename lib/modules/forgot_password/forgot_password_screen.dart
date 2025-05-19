import 'package:e2mars/export.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  ForgotPasswordScreen({super.key});

  final _forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  keyEnterYourEmail.tr,
                  style: textStyleHeadlineLarge(),
                ).paddingOnly(top: 15.h),
                Text(
                  keyEnterEmailFOrVerification.tr,
                  style: textStyleTitleSmall(),
                ).paddingOnly(top:4.h,bottom: 5.h),
                _form(),
                _sendCodeButton(),
              ],
            ).paddingSymmetric(horizontal: 22.w)
          ],
        ));
  }

  _form() => Form(
      key: _forgotPasswordFormKey,
      child: TextFieldWidget(
        textController: controller.emailTextController,
        focusNode: controller.emailFocusNode,
        label: keyEmail.tr,
        validate: (value) => EmailValidator.validateEmail(value ?? ''),
      ).paddingOnly(top: 30.h, bottom: 12.h));

  _sendCodeButton() => CustomButtonWidget(
        onPressed: () {
          if (_forgotPasswordFormKey.currentState!.validate()) {
            controller.requestOTPApi();
          }
        },
        isLoading: controller.isOtpRequested,
        buttonText: keySendCode.tr,
      ).paddingSymmetric(vertical: 10.h);
}
