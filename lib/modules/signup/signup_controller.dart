import 'package:e2mars/export.dart';
import 'package:e2mars/utils/const.dart';

class SignupController extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();

  TextEditingController emailTextController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  TextEditingController firstNameTextController = TextEditingController();
  FocusNode firstNameFocusNode = FocusNode();

  TextEditingController lastNameTextController = TextEditingController();
  FocusNode lastNameFocusNode = FocusNode();

  TextEditingController phoneNumberTextController = TextEditingController();
  FocusNode phoneNumberFocusNode = FocusNode();

  TextEditingController addressTextController = TextEditingController();
  FocusNode addressFocusNode = FocusNode();

  TextEditingController dateOfBirth = TextEditingController();
  FocusNode dateOfBirthFocusNode = FocusNode();

  TextEditingController passwordTextController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController confirmPasswordTextController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();

  TextEditingController referralCodeTextController = TextEditingController();
  FocusNode referralCodeFocusNode = FocusNode();

  RxBool viewPassword = true.obs;
  RxBool viewConfirmPassword = true.obs;
  RxBool isPhoneValidated = false.obs;
  RxBool signUpLoading = false.obs;

  RxInt activeStep = 0.obs;

  Rx<MessageResponseModel> messageResponseModel = MessageResponseModel().obs;

  @override
  void onInit() {
    // if(kDebugMode) {
    //   firstNameTextController.text = "pankaj";
    //   lastNameTextController.text = "Bedwal";
    //   emailTextController.text = "abc@gmail.com";
    //   phoneNumberTextController.text = "1234567890";
    //   passwordTextController.text = "1234567890";
    //   confirmPasswordTextController.text = "1234567890";
    // }
    super.onInit();
  }

  Rx<Country> selectedCountry = const Country(
      name: 'United States',
      code: 'US',
      dialCode: '1',
      flag: '🇺🇸',
      maxLength: 10,
      minLength: 10,
      nameTranslations: {}).obs;

  signUpApi() {
    signUpLoading.value = true;
    Map<String, dynamic> requestModel = RequestModel.signupRequestModel(
      email: emailTextController.text.trim(),
      password: passwordTextController.text.trim(),
      phoneCode: selectedCountry.value.code,
      firstName: firstNameTextController.text.trim(),
      lastName: lastNameTextController.text.trim(),
      phoneNumber: phoneNumberTextController.text.trim(),
      confirmPassword: confirmPasswordTextController.text.trim(),
      role: currentRole,
    );
    _repository.signupApiCall(dataBody: requestModel).then((value) async {
      if (value != null) {
        signUpLoading.value = false;
        messageResponseModel.value = value;
        Get.back();
        showToast(message: messageResponseModel.value.message.toString());
      }
    }).onError((error, stackTrace) {
      signUpLoading.value = false;
      showToast(message: error.toString());
    });
  }




  checkEmailApi() {
    signUpLoading.value = true;
    Map<String, dynamic> requestModel = {};
    requestModel['email'] = emailTextController.text.trim();
    _repository.checkEmailApiCall(dataBody: requestModel).then((value) async {
      if (value != null) {
        signUpLoading.value = false;
        messageResponseModel.value = value;
        if(messageResponseModel.value.success??false){

          Const.firstName=firstNameTextController.text.trim();
          Const.lastName=lastNameTextController.text.trim();
          Const.email=emailTextController.text.trim();
          Const.phoneNumber=phoneNumberTextController.text.trim();
          Const.password=passwordTextController.text.trim();
          Const.confirmPassword=confirmPasswordTextController.text.trim();
          Const.dateOfBirth=dateOfBirth.text.trim();
          Const.phoneCode=selectedCountry.value.code;
          Get.toNamed(AppRoutes.routeUploadDocuments);
        }
        else{
          signUpLoading.value = false;
          showToast(message: "Email already exists");
        }
      }

      signUpLoading.value=false;

    }).onError((error, stackTrace) {
      signUpLoading.value = false;
      showToast(message: error.toString());
    });
  }
}
