import 'package:e2mars/export.dart';


class VehicleInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VehicleInfoFormController>(
          () => VehicleInfoFormController(),
    );
  }
}
