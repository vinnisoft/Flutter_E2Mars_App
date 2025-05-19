import 'package:e2mars/export.dart';

class OtpVerificationController extends GetxController {
  final APIRepository _repository = Get.find<APIRepository>();
  final LocalStorage _localStorage = Get.find<LocalStorage>();

  TextEditingController otpTextController = TextEditingController();
  FocusNode otpFocusNode = FocusNode();

  Rx<MessageResponseModel> messageResponseModel = MessageResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;

  RxBool resendLoading = false.obs;
  RxBool verifyOtpLoading = false.obs;

  RxString email = ''.obs;

  Timer? timer;
  RxInt start = 60.obs;
  RxString secondsStr = '00:60'.obs;

  RxString otpCode = ''.obs;
  RxString otpErrorMessage = ''.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      email.value = Get.arguments['email'];
    }
    startTimer();
    super.onInit();
  }

  verifyOTPApi() {
    verifyOtpLoading.value = true;
    Map<String, dynamic> requestModel = RequestModel.verifyOtpRequestModel(
        email: email.value, otp: otpTextController.text.trim(),
    );
    _repository.verifyOtpApiCall(dataBody: requestModel).then((value) async {
      if (value != null) {
        verifyOtpLoading.value = false;
        loginResponseModel.value = value;
          Get.offAllNamed(AppRoutes.routeResetPassword,
              arguments: {'access-token': loginResponseModel.value.data?.token});
          showToast(message: loginResponseModel.value.message.toString());
      }
    }).onError((error, stackTrace) {
      verifyOtpLoading.value = false;
      showToast(message: error.toString());
    });
  }

  requestOTPApi() {
    resendLoading.value = true;
    Map<String, dynamic> requestModel = RequestModel.requestOtpRequestModel(
      email: email.value,
    );
    _repository.forgotPasswordApiCall(dataBody: requestModel).then((value) async {
      if (value != null) {
        resendLoading.value = false;
        start.value = 60;
        startTimer();
        messageResponseModel.value = value;
        showToast(message: messageResponseModel.value.message.toString());
      }
    }).onError((error, stackTrace) {
      resendLoading.value = false;
      showToast(message: error.toString());
    });
  }

  onOtpTextFieldChange(String value) {
    if (value.length == 4) {
      FocusManager.instance.primaryFocus?.unfocus();
      verifyOTPApi();
    } else if (value == '') {
      otpErrorMessage.value = 'Otp cannot be empty!';
    }else if (value.length < 4) {
      otpErrorMessage.value = 'Please enter complete OTP!';
    }
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
          secondsStr.value = '00:${(start.value).toString().padLeft(2, '0')}';
        }
      },
    );
  }
}
