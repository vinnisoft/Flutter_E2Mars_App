import 'package:e2mars/utils/const.dart';

import '../../export.dart';

class BankInfoFormController extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();
RxInt activeStep=3.obs;
TextEditingController accountHolderTextController=TextEditingController();
TextEditingController bankNumberTextController=TextEditingController();
TextEditingController ifscTextController=TextEditingController();

RxBool isLoading = false.obs;
submitBankInfo(){
  if(accountHolderTextController.text.isEmpty ||
      bankNumberTextController.text.isEmpty ||
      ifscTextController.text.isEmpty){
    Get.snackbar(
      "Incomplete",
      "Please fill all the fields.",
      snackPosition: SnackPosition.BOTTOM,
    );

    return;
  }

  signUpApi();
  // If all fields are filled, proceed
  // Get.toNamed(AppRoutes.routeUploadDocuments);
}



signUpApi() {
  isLoading.value = true;
  Map<String, dynamic> requestModel = RequestModel.signupRequestModel(
    email: Const.email,
    password: Const.password,
    phoneCode: Const.phoneCode,
    firstName: Const.firstName,
    lastName: Const.lastName,
    phoneNumber: Const.phoneNumber,
    confirmPassword: Const.confirmPassword,

    role: currentRole,

    //new


  );

  requestModel['vehicle_type']=Const.vehicleType;
  requestModel['vehicle_model']=Const.model;
  requestModel['vehicle_color']=Const.color;
  requestModel['vehicle_number']=Const.plateNumber;
  requestModel['year_of_manufacture']=Const.yearOfManufacture;


  requestModel['bank_name']=accountHolderTextController.text;
  requestModel['account_number']=bankNumberTextController.text;
  requestModel['ifsc_code']=ifscTextController.text;



// return print("requestModel: $requestModel");

  _repository.signupApiCall(dataBody: requestModel).then((value) async {
    if (value != null) {

      // messageResponseModel.value = value;
      // Get.back();
      if(value.success??false){
        isLoading.value = false;
        Get.dialog(
          Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      // Icon
                      AssetImageWidget(AppImages.icCongratulation),
                      const SizedBox(height: 20),
                      // Title
                      const Text(
                        'Congratulations',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Subtext
                      const Text(
                        'Your information has been\nsubmitted successfully.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: AppColors.secondaryTextColor),
                      ),
                      const SizedBox(height: 24),
                      // Button
                      GestureDetector(
                        onTap: () {
                          Get.back(); // Close the dialog
                          Get.offAllNamed(AppRoutes.routeLogin); // Replace with: AppRoutes.routeLogin
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 12),
                          decoration: BoxDecoration(
                            color: AppColors.appColor, // Your custom app color
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child:  Text(
                            'Go To Login',
                            style: TextStyle(
                              color: AppColors.primaryTextColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  // Close Icon
                  Positioned(
                    right: 0,
                    top: 0,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child:  Icon(Icons.close,size: 20.sp,),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }

    }
    isLoading.value = false;
  }).onError((error, stackTrace) {
    isLoading.value = false;
    showToast(message: error.toString());
  });
}

}