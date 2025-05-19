import 'package:e2mars/export.dart';
import 'package:easy_stepper/easy_stepper.dart';

import '../../export.dart' as CommonAlertDialog;

class SignupScreen extends GetView<SignupController> {
  SignupScreen({super.key});

  final _signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          appBarTitle: Text(keySignup.tr,style:textStyleTitleLarge().copyWith(
              color: AppColors.primaryTextColor,
              fontWeight: FontWeight.w600)),

        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text(
              //   keyCreateAccount.tr,
              //   style: textStyleHeadlineLarge(),
              // ).paddingSymmetric(horizontal: 22.w),
              // Text(
              //   keyCreateAccountDesc.tr,
              //   style: textStyleTitleSmall(),
              // ).paddingOnly(top: 4.h, bottom: 5.h, left: 22.w, right: 22.w),
              _easyStepper(),
              Text(
                keyPersonalInfo.tr,
                style: textStyleHeadlineMedium(),
              ).paddingSymmetric(horizontal: 22.w),
              _step1Form(),
              Obx(()=>controller.signUpLoading.value?Center(child: CircularProgressIndicator(color: AppColors.secondaryAppColor)):_signUpButton()),
              /*_form(),
              _sendOtpButton(),*/
              _alreadyHaveAccount()
            ],
          ),
        ));
  }
  _easyStepper() => EasyStepper(
        activeStep: controller.activeStep.value,
        activeStepTextColor: Colors.black,
        finishedStepTextColor: Colors.black,
        showTitle: true,
        internalPadding: 0,
        showLoadingAnimation: false,
        stepRadius: 12.r,
        titlesAreLargerThanSteps: true,
        showStepBorder: false,
        lineStyle: LineStyle(
          lineSpace: 0,
          activeLineColor: AppColors.secondaryTextColor.withOpacity(0.1),
          finishedLineColor: AppColors.secondaryAppColor,
          lineLength: Get.width*0.175,
          lineThickness: 1.2.w,
          defaultLineColor: AppColors.secondaryTextColor.withOpacity(0.1),
          unreachedLineColor: AppColors.secondaryTextColor.withOpacity(0.1)
        ),
        unreachedStepTextColor: Colors.black,
        steps: [
          EasyStep(
            customStep: CircleAvatar(
              radius: 12.r,
              backgroundColor: AppColors.secondaryAppColor,
              child: CircleAvatar(
                radius: 4.r,
                backgroundColor: Colors.white,
              ),
            ),
            customTitle: Text(
                'Personal \nInfo',
              textAlign: TextAlign.center,
              style: textStyleTitleSmall().copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor),
            ),
          ),
          EasyStep(
            customStep: CircleAvatar(
              radius: 12.r,
              backgroundColor: controller.activeStep.value >= 1 ? AppColors.secondaryAppColor : AppColors.secondaryTextColor,
              child: CircleAvatar(
                radius: 4.r,
                backgroundColor: Colors.white,
              ),
            ),
            customTitle: Text(
              "Upload \ndocuments",
              textAlign: TextAlign.center,
              style: textStyleTitleSmall().copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor),
            ),
          ),
          EasyStep(
            customStep: CircleAvatar(
              radius: 12.r,
              backgroundColor: controller.activeStep.value >= 2 ? AppColors.secondaryAppColor : AppColors.secondaryTextColor,
              child: CircleAvatar(
                radius: 4.r,
                backgroundColor: Colors.white,
              ),
            ),
            customTitle: Text(
              "Vehicle \ninfo",
              textAlign: TextAlign.center,
              style: textStyleTitleSmall().copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor),
            ),
          ),
          EasyStep(
            customStep: CircleAvatar(
              radius: 12.r,
              backgroundColor: controller.activeStep.value >= 3 ? AppColors.secondaryAppColor: AppColors.secondaryTextColor,
              child: CircleAvatar(
                radius: 4.r,
                backgroundColor: Colors.white,
              ),
            ),
            customTitle: Text(
              "Bank \ninfo",
              textAlign: TextAlign.center,
              style: textStyleTitleSmall().copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor),
            ),
          ),
        ],
        onStepReached: (index) => controller.activeStep.value = index,
      ).paddingSymmetric(vertical: 10.h);

  _step1Form() => Form(
      key: _signupFormKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFieldWidget(
                  textController: controller.firstNameTextController,
                  focusNode: controller.firstNameFocusNode,
                  label: keyFirstName.tr,
                  validate: (value) => FieldChecker.fieldChecker(
                      value: value ?? '', message: keyFirstName.tr),
                ),
              ),
              SizedBox(
                width: 15.h,
              ),
              Expanded(
                child: TextFieldWidget(
                  textController: controller.lastNameTextController,
                  focusNode: controller.lastNameFocusNode,
                  label: keyLastName.tr,
                  validate: (value) => FieldChecker.fieldChecker(
                      value: value ?? '', message: keyLastName.tr),
                ),
              ),
            ],
          ).paddingSymmetric(vertical: 6.h),
          TextFieldWidget(
            textController: controller.emailTextController,
            focusNode: controller.emailFocusNode,
            label: keyEmail.tr,
            validate: (value) => EmailValidator.validateEmail(value ?? ''),
          ).paddingSymmetric(vertical: 6.h),
          CustomPhoneTextField(
            controller: controller.phoneNumberTextController,
            focusNode: controller.phoneNumberFocusNode,
            initialCountryCode: controller.selectedCountry.value.code,
            label: keyPhoneNumber.tr,
            textInputAction: TextInputAction.done,
            onCountryChange: (value) {
              controller.selectedCountry.value = value;
              controller.selectedCountry.refresh();
            },
          ).paddingSymmetric(vertical: 6.h),


          // TextFieldWidget(
          //   textController: controller.dateOfBirth,
          //   focusNode: controller.dateOfBirthFocusNode,
          //   label: keyDateOfBirth.tr,
          //   validate: (value) => FieldChecker.fieldChecker(
          //       value: value ?? '', message: keyDateOfBirth.tr),
          // ).paddingSymmetric(vertical: 6.h),
          Obx(
            () => TextFieldWidget(
              textController: controller.passwordTextController,
              focusNode: controller.passwordFocusNode,
              label: keyPassword.tr,
              obscureText: controller.viewPassword.value,
              validate: (value) =>
                  PasswordFormValidator.validatePassword(value ?? ''),
              maxLength: 16,
              suffixIcon: InkWell(
                onTap: () => controller.viewPassword.value =
                    !controller.viewPassword.value,
                child: AssetImageWidget(
                  controller.viewPassword.value
                      ? AppImages.iconsHidePassword
                      : AppImages.iconsShowPassword,
                  imageHeight: 10.h,
                ).paddingSymmetric(vertical: 8.h, horizontal: 14.w),
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
                  imageHeight: 10.h,
                ).paddingSymmetric(vertical: 8.h, horizontal: 14.w),
              ),
            ).paddingSymmetric(vertical: 6.h),
          ),
          currentRole == "rider" ?  TextFieldWidget(
            textController: controller.referralCodeTextController,
            focusNode: controller.referralCodeFocusNode,
            label: keyReferralCode.tr,
          ).paddingSymmetric(vertical: 6.h) :  SizedBox(),
        ],
      )).paddingSymmetric(vertical: 10.h, horizontal: 22.w);

  _sendOtpButton() => CustomButtonWidget(
        onPressed: () {
          if (_signupFormKey.currentState!.validate()) {
            controller.signUpApi();
          }
        },
        isLoading: controller.signUpLoading,
        buttonText: keySignup.tr,
      ).paddingSymmetric(vertical: 10.h);

  _alreadyHaveAccount() => Align(
        alignment: Alignment.center,
        child: Text.rich(
          TextSpan(
              text: keyAlreadyHaveAccount.tr,
              style: textStyleTitleMedium()
                  .copyWith(color: AppColors.secondaryTextColor),
              children: [
                TextSpan(
                    text: keyLogin.tr,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.back();
                      },
                    style: textStyleTitleMedium().copyWith(
                        color: AppColors.secondaryAppColor,
                        fontWeight: FontWeight.w600))
              ]),
        ).paddingSymmetric(vertical: 30.h),
      );



  _signUpButton() => CustomButtonWidget(
    onPressed: () {


      if (_signupFormKey.currentState!.validate()) {
        if(currentRole=="rider"){
          controller.signUpApi();
        }
         else{
          controller.checkEmailApi();
        }
      }
    },
    // isLoading: controller.loginLoading,
    buttonText: keyNext.tr,
  ).paddingSymmetric(vertical: 10.h,horizontal: 22.w);



}
