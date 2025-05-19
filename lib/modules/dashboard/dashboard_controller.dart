import 'package:e2mars/export.dart';

class DashboardController extends GetxController {

  final APIRepository _repository = Get.find<APIRepository>();
  final LocalStorage _localStorage = Get.find<LocalStorage>();

  Rx<LoginDataModel> userData = LoginDataModel().obs;


  RxList<Widget> riderScreens = <Widget>[
    RiderHomeScreen(),
    Container(),
    Container(),
    ProfileScreen(),
  ].obs;

  RxList<Widget> driverScreens = <Widget>[
    DriverHomeScreen(),
    Container(),
    Container(),
    ProfileScreen(),
  ].obs;

  RxInt selectedTab = 0.obs;

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  getUserData() async {
    userData.value = await _localStorage.getSavedLoginData();
  }


}
