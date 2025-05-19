import 'package:e2mars/export.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
          () => DashboardController(),
    );
    Get.lazyPut<RiderHomeController>(
          () => RiderHomeController(),
    );
    Get.lazyPut<DriverHomeController>(
          () => DriverHomeController(),
    );
    Get.lazyPut<MyRidesController>(
          () => MyRidesController(),
    );
    Get.lazyPut<HelpController>(
          () => HelpController(),
    );
    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
  }
}
