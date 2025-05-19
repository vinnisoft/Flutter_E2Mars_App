import 'package:e2mars/export.dart';

class SplashController extends GetxController {
  Timer? timer;

  final LocalStorage _localStorage = Get.find<LocalStorage>();

  RxString currentImage = AppImages.iconsAppLogo.obs;

  @override
  void onInit() {
    _navigateToNextScreen();
    super.onInit();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  // getToken() async {
  //   final fcmToken = await FirebaseMessaging.instance.getToken();
  //   if (fcmToken != null) {
  //     debugPrint('token -----> $fcmToken');
  //
  //     _localStorage.saveFirebaseToken(fcmToken);
  //   }
  // }

  //*===================================================================== Check App validity ==========================================================*
  void _navigateToNextScreen() =>
      timer = Timer(const Duration(seconds: 3, milliseconds: 500), () async {
        currentRole = await _localStorage.getSelectedRole();
        if (_localStorage.getAuthToken() != null &&
            _localStorage.getAuthToken() != "") {
          Get.offAllNamed(AppRoutes.routeDashboard);
        } else if (currentRole != "") {
          Get.offAllNamed(AppRoutes.routeLogin);
        } else {
          Get.offAllNamed(AppRoutes.routeRoleSelection);
        }
        // getToken();
      });
}
