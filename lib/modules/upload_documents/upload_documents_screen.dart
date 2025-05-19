import 'package:easy_stepper/easy_stepper.dart' as easy_stepper;

import '../../export.dart';
import '../../utils/helper.dart';

class UploadDocumentsScreen extends GetView<UploadDocumentsController> {
  const UploadDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              keyUploadDocuments.tr,
              style: textStyleHeadlineMedium(),
            ).paddingSymmetric(horizontal: 22.w),
            SizedBox(height: 20.h),
            // Text(
            //    "Driver's license",
            //   style: textStyleTitleSmall().copyWith(color: AppColors.primaryTextColor, fontWeight: FontWeight.w500),
            // ).paddingOnly(bottom: 6.w),

            Obx(() => UploadImageBox2(
              label: "Driver's license",
              imagePath: controller.licenseFile.value?.path,
              onUpload: () async {
                showImagePickerBottomSheet(()async{
                  if (await Helper.storagePermission()){
                    final file = await Helper.takePhoto();
                    if (file != null) controller.licenseFile.value = file;
                  }
                },
                    ()async{
                      if (await Helper.storagePermission()){
                      final file = await Helper.pickFile();
                      if (file != null) controller.licenseFile.value = file;
                      }
                    }
                );

              },
            )).paddingSymmetric(horizontal: 22.w),


            Obx(() => UploadImageBox2(
              label: "Vehicle registration",
              imagePath: controller.registrationFile.value?.path,
              onUpload: () async {

                showImagePickerBottomSheet(()async{
                  if (await Helper.storagePermission()){
                    final file = await Helper.takePhoto();
                    if (file != null) controller.registrationFile.value = file;
                  }
                },
                        ()async{
                          if (await Helper.storagePermission()) {
                            final file = await Helper.pickFile();
                            if (file != null) controller.registrationFile.value = file;
                          }
                    }
                );


              },
            )).paddingSymmetric(horizontal: 22.w),

            Obx(() => UploadImageBox2(
              label: "Insurance",
              imagePath: controller.insuranceFile.value?.path,
              onUpload: () async {
                showImagePickerBottomSheet(()async{
                  if (await Helper.storagePermission()){
                    final file = await Helper.takePhoto();
                    if (file != null) controller.insuranceFile.value = file;
                  }
                },
                        ()async{
                          if (await Helper.storagePermission()) {
                            final file = await Helper.pickFile();
                            if (file != null) controller.insuranceFile.value = file;
                          }
                    }
                );

              },
            )).paddingSymmetric(horizontal: 22.w),

            Obx(() => UploadImageBox2(
              label: "Profile photo",
              imagePath: controller.profilePhotoFile.value?.path,
              onUpload: () async {


                showImagePickerBottomSheet(()async{
                  if (await Helper.storagePermission()){
                    final file = await Helper.takePhoto();
                    if (file != null) controller.profilePhotoFile.value = file;
                  }
                },
                        ()async{
                          if (await Helper.storagePermission()) {
                            final file = await Helper.pickFile();
                            if (file != null) controller.profilePhotoFile.value = file;
                          }
                    }
                );

              },
            )).paddingSymmetric(horizontal: 22.w),

            _bottomButton(),
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
            controller.checkDocuments();
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 22.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.r),
              color: AppColors.appColor,
            ),
            child: Text(keyNext.tr,style: textStyleBodyMedium().copyWith(color: AppColors.primaryTextColor,fontSize:16.sp,fontWeight: FontWeight.w400),).paddingSymmetric(horizontal: 22.w),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 22.w,vertical: 10.h);
  }


  void showImagePickerBottomSheet(Function() imageCallBack, Function() callback) {
    Get.bottomSheet(
      Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              height: 6,
              width: 60,
              margin: const EdgeInsets.only(top: 12, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
            ),

            const Text(
              "Choose from",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // From Camera
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.blue),
              title: const Text("Camera"),
              onTap: () {
                Get.back(); // Close bottom sheet
               imageCallBack();
              },
            ),

            // From Gallery
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.green),
              title: const Text("Gallery"),
              onTap: () {
                Get.back(); // Close bottom sheet
                callback();
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
      barrierColor: Colors.black26,
      isDismissible: true,
      enableDrag: true,
    );
  }



}



class UploadImageBox extends StatelessWidget {
  final String label;
  final VoidCallback onUpload;
  final String? imagePath; // 👈 Add this

  const UploadImageBox({
    Key? key,
    required this.label,
    required this.onUpload,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasImage = imagePath != null && imagePath!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5.h),
        DottedBorder(
          color: Colors.grey,
          strokeWidth: 1,
          dashPattern: [8, 6],
          borderType: BorderType.RRect,
          radius: Radius.circular(8.r),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              width: double.infinity,
              height: 120,
              color: Colors.white,
              alignment: Alignment.center,
              child: hasImage
                  ? Image.file(
                File(imagePath!),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              )
                  : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryAppColor,
                  shape: StadiumBorder(),
                ),
                onPressed: onUpload,
                child: Text(
                  "upload image",
                  style: textStyleBodyMedium().copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ).paddingOnly(bottom: 20.h);
  }


}

