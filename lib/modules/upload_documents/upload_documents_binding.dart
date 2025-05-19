import 'package:e2mars/export.dart';


class UploadDocumentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadDocumentsController>(
          () => UploadDocumentsController(),
    );
  }
}
