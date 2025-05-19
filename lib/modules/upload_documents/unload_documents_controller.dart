import '../../export.dart';
import '../../utils/const.dart';

class UploadDocumentsController extends GetxController {

  Rx<File?> licenseFile = Rx<File?>(null);
  Rx<File?> registrationFile = Rx<File?>(null);
  Rx<File?> insuranceFile = Rx<File?>(null);
  Rx<File?> profilePhotoFile = Rx<File?>(null);
  RxInt activeStep=1.obs;

  void checkDocuments() {
    if (licenseFile.value == null ||
        registrationFile.value == null ||
        insuranceFile.value == null ||
        profilePhotoFile.value == null) {
      Get.snackbar(
        "Incomplete",
        "Please upload all required documents.",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Const.drivingLicense = licenseFile.value?? File("");
    Const.vehicleRegistration = registrationFile.value?? File("");
    Const.insurance = insuranceFile.value?? File("");
    Const.profile = profilePhotoFile.value?? File("");
    // If all files are uploaded, proceed
    Get.toNamed(AppRoutes.routeVehicleFormInfo);
  }

}