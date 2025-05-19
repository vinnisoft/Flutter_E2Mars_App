import 'package:e2mars/export.dart';

class RoleSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoleSelectionController>(
          () => RoleSelectionController(),
    );
  }
}
