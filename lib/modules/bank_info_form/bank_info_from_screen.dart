import 'package:easy_stepper/easy_stepper.dart' as easy_stepper;

import '../../export.dart';

class BankInfoFromScreen extends GetView<BankInfoFormController> {
   BankInfoFromScreen({super.key});
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
          children: [
            _easyStepper(),
            Text(
              "Bank info",
              style: textStyleHeadlineMedium(),
            ).paddingSymmetric(horizontal: 22.w),
            SizedBox(height: 10.sp,),
            _step1Form(),
             SizedBox(height: 120.h,),
            Obx(()=>controller.isLoading.value?Center(child: CircularProgressIndicator(color: AppColors.secondaryAppColor)):_bottomButton())
          ],
        ),
      ),
    );
  }




  _easyStepper() => easy_stepper.EasyStepper(
    activeStep: controller.activeStep.value,
    activeStepTextColor: Colors.black,
    finishedStepTextColor: Colors.black,
    showTitle: true,
    internalPadding: 0,
    showLoadingAnimation: false,
    stepRadius: 12.r,
    titlesAreLargerThanSteps: true,
    showStepBorder: false,
    lineStyle: easy_stepper.LineStyle(
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
      easy_stepper.EasyStep(
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
      easy_stepper.EasyStep(
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
      easy_stepper.EasyStep(
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
      easy_stepper.EasyStep(
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

          TextFieldWidget(
            textController: controller.bankNumberTextController,
            // focusNode: controller.firstNameFocusNode,
            label: "Bank account number ".tr,
            validate: (value) => FieldChecker.fieldChecker(
                value: value ?? '', message: "Bank account number "),
          ).paddingSymmetric(vertical: 6.h),

          TextFieldWidget(
            textController: controller.ifscTextController,
            // focusNode: controller.lastNameFocusNode,
            label: "IFSC/SWIFT code".tr,
            validate: (value) => FieldChecker.fieldChecker(
                value: value ?? '', message:"IFSC/SWIFT code"),
          ).paddingSymmetric(vertical: 6.h),


          TextFieldWidget(
            textController: controller.accountHolderTextController,
            // focusNode: controller.emailFocusNode,
            label: "Account holder name",
            validate: (value) => FieldChecker.fieldChecker(
                value: value ?? '', message: "Account holder name"),
          ).paddingSymmetric(vertical: 6.h),

        ],
      )).paddingSymmetric(vertical: 10.h, horizontal: 22.w);


  _bottomButton() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 22.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.r),
              border: Border.all(color: AppColors.secondaryTextColor),
            ),
            child: Text(keyBack.tr,style: textStyleBodyMedium().copyWith(color: AppColors.secondaryTextColor,fontSize:16.sp,fontWeight: FontWeight.w400),).paddingSymmetric(horizontal: 22.w),
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: (){
           controller.submitBankInfo();
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 22.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.r),
              color: AppColors.appColor,
            ),
            child: Text("Submit",style: textStyleBodyMedium().copyWith(color: AppColors.primaryTextColor,fontSize:16.sp,fontWeight: FontWeight.w400),).paddingSymmetric(horizontal: 22.w),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 22.w,vertical: 10.h);
  }
}
