import 'package:e2mars/export.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<APIRepository>(
      () => APIRepository(),
      fenix: true,
    );
    Get.lazyPut<LocalStorage>(
      () => LocalStorage(),
      fenix: true,
    );
    SplashBinding().dependencies();
  }
}
