
import 'package:e2mars/export.dart';

class BankInfoFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BankInfoFormController>(
          () => BankInfoFormController(),
    );
  }
}
