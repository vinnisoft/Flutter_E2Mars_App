import 'package:e2mars/export.dart';

class E2ReferController extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();
  final LocalStorage _localStorage = Get.find<LocalStorage>();

  Rx<LoginDataModel> loginDataModel = LoginDataModel().obs;



  @override
  void onInit() {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    loginDataModel.value = await _localStorage.getSavedLoginData();
    super.onReady();
  }



}
