import 'package:e2mars/export.dart';

class E2ReferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<E2ReferController>(
          () => E2ReferController(),
    );
  }
}
