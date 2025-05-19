import 'package:e2mars/export.dart';
import 'package:flutter/gestures.dart';

class OtpVerificationScreen extends GetView<OtpVerificationController> {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              keyEnter4DigitCode.tr,
              style: textStyleHeadlineLarge(),
            ).paddingOnly(top: 30.h, bottom: 4.h),
            Text(
              keyEnterCodeSentToEmail.tr,
              style: textStyleTitleSmall(),
            ).paddingOnly(bottom: 5.h),
            _form(),
            _otpMatches(),
            _verifyButton(),
            _resend(),
          ],
        ).paddingSymmetric(
          horizontal: 22.w,
        ));
  }

  _form() => Pinput(
        controller: controller.otpTextController,
        focusNode: controller.otpFocusNode,
        length: 4,
        onChanged: (value) {
          controller.otpCode.value = value;
        },
        defaultPinTheme: PinTheme(
          textStyle: textStyleLabelMedium(),
            width: 48.w,
            height: 43.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.white,
                border: Border.all(
                    color: AppColors.secondaryTextColor, width: 1.w))),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        focusedPinTheme: PinTheme(
            width: 48.w,
            height: 43.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.white,
                border: Border.all(
                    color: AppColors.secondaryTextColor, width: 1.w))),
        errorPinTheme: PinTheme(
            width: 48.w,
            height: 43.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.white,
                border: Border.all(color: Colors.red, width: 1.w))),
        disabledPinTheme: PinTheme(
            width: 48.w,
            height: 43.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.white,
                border: Border.all(
                    color: AppColors.secondaryTextColor, width: 1.w))),
        // validator: (value) => OtpFormValidator.validateOtpField(value: value!),
      ).paddingOnly(top: 30.h, left: 20.h, right: 20.h);

  _otpMatches() => Obx(
        () => Visibility(
          visible: controller.otpErrorMessage.value != '',
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              controller.otpErrorMessage.value,
              textAlign: TextAlign.start,
              style: textStyleBodyLarge().copyWith(
                  color: Colors.red,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300),
            ).paddingOnly(left: 15.w, top: 5.h),
          ),
        ).paddingOnly(bottom: 15.h),
      );

  _verifyButton() => CustomButtonWidget(
        onPressed: () {
          controller.onOtpTextFieldChange(controller.otpCode.value);
        },
        isLoading: controller.verifyOtpLoading,
        buttonText: keyVerify.tr,
      ).paddingOnly(top: 10.h, bottom: 20.h, left: 20.h, right: 20.h);

  _resend() => Obx(
        () => Align(
          alignment: Alignment.center,
          child: Text.rich(TextSpan(
              text: keyCodeNotReceived.tr,
              style: textStyleTitleMedium(),
              children: [
                controller.start.value == 0
                    ? TextSpan(
                        text: keyResend.tr,
                        recognizer: TapGestureRecognizer()
                          ..onTap = controller.resendLoading.value
                              ? () {}
                              : () {
                                   controller.requestOTPApi();
                                },
                        style: textStyleTitleMedium().copyWith(
                            color: AppColors.secondaryAppColor,
                            fontWeight: FontWeight.w500))
                    : TextSpan(
                        text: controller.secondsStr.value,
                        style: textStyleTitleMedium()
                            .copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500))
              ])),
        ),
      );
}
