import 'package:e2mars/export.dart';

class RoleSelectionController extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();
  final LocalStorage _localStorage = Get.find<LocalStorage>();

  RxString role = "".obs;


  @override
  void onInit() {
    super.onInit();
  }

  onContinue() {
    if(role.value != ''){
      currentRole = role.value;
      _localStorage.saveRole(role.value);
      Get.offAllNamed(AppRoutes.routeOnBoarding);
    }
  }



}
