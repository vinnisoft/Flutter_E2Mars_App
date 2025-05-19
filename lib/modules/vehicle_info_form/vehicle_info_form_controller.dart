import 'package:e2mars/utils/const.dart';

import '../../export.dart';

class VehicleInfoFormController extends GetxController {
RxInt activeStep=2.obs;

TextEditingController bandModelTextController = TextEditingController();
TextEditingController plateNumberTextController = TextEditingController();
TextEditingController manufactureTextController = TextEditingController();
TextEditingController colorTextController = TextEditingController();
String selectedVehicleType = "";

Rx<File?> pickedFile = Rx<File?>(null);

checkVehicleInfo(){
  if(selectedVehicleType.trim().isEmpty){
    Get.snackbar(
      "Incomplete",
      "Please select vehicle type.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  if (bandModelTextController.text.isEmpty ||
      plateNumberTextController.text.isEmpty ||
      manufactureTextController.text.isEmpty ||
      colorTextController.text.isEmpty) {
    Get.snackbar(
      "Incomplete",
      "Please fill all the fields.",
      snackPosition: SnackPosition.BOTTOM,
    );
    return;
  }
  if(pickedFile.value==null){
    Get.snackbar(
      "Incomplete",
      "Please upload vehicle image.",
      snackPosition: SnackPosition.BOTTOM,
    );
    return;
  }

Const.vehicleType=selectedVehicleType;
  Const.model=bandModelTextController.text;
  Const.plateNumber=plateNumberTextController.text;
  Const.yearOfManufacture=manufactureTextController.text;
  Const.color=colorTextController.text;
  Const.vehiclePhoto=pickedFile.value?? File("");
  // If all fields are filled, proceed
  Get.toNamed(AppRoutes.routeBankInfoForm);
}
}