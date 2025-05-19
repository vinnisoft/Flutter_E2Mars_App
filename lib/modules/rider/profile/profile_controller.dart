import 'package:e2mars/export.dart';

class ProfileController extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();
  final LocalStorage _localStorage = Get.find<LocalStorage>();

  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;


  @override
  void onInit() {
    getProfileApi();
    super.onInit();
  }

  getProfileApi() {
      _repository.getProfileApi().then((value) async {
        if (value != null) {
          loginResponseModel.value = value;
          _localStorage.saveRegisterData(loginResponseModel.value.data);
        }
      }).onError((error, stackTrace) {
        showToast(message: error.toString());
      });
  }

}
