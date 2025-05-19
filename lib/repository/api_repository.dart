import 'package:e2mars/export.dart';

import '../utils/const.dart';

class APIRepository {
  late DioClient? dioClient;

  APIRepository() {
    var dio = Dio();
    dioClient = DioClient(baseUrl, dio);
    DeviceConfig.init();
  }


/*===================================================================== forgot password API Call  ==========================================================*/

  Future forgotPasswordApiCall(
      {required Map<String, dynamic>? dataBody}) async {
    try {
      final response =
          await dioClient!.post(forgotPasswordEndPoint, data: dataBody!);
      return MessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  /*===================================================================== verify otp API Call  ==========================================================*/

  Future verifyOtpApiCall({required Map<String, dynamic>? dataBody}) async {
    try {
      final response =
          await dioClient!.post(verifyOtpEndPoint, data: dataBody!);
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

/*===================================================================== login  API Call  ==========================================================*/

  Future loginApiCall({required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!.post(loginEndPoint, data: dataBody!);
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

/*===================================================================== change password API Call  ==========================================================*/

  // Future signupApiCall({required Map<String, dynamic>? dataBody}) async {
  //   //   try {
  //   //     final response = await dioClient!
  //   //         .post(signUpEndPoint, data: dataBody!, skipAuth: false);
  //   //     return MessageResponseModel.fromJson(response);
  //   //   } catch (e) {
  //   //     return Future.error(NetworkExceptions.getDioException(e));
  //   //   }
  //   // }


  Future signupApiCall({
    required Map<String, dynamic> dataBody,
    File? imageFile, // 👈 optional image file
  }) async {
    try {
      // Prepare multipart form data
      final formData = FormData.fromMap({
        ...dataBody,

        if (Const.vehiclePhoto.path.isNotEmpty)
          'vehicle_photo': await MultipartFile.fromFile(
            Const.vehiclePhoto.path,
            filename: Const.vehiclePhoto.path.split('/').last,
          ),

        if (Const.drivingLicense.path.isNotEmpty)
          'driving_license': await MultipartFile.fromFile(
            Const.drivingLicense.path,
            filename: Const.drivingLicense.path.split('/').last,
          ),

        if (Const.vehicleRegistration.path.isNotEmpty)
          'vehicle_registration': await MultipartFile.fromFile(
            Const.vehicleRegistration.path,
            filename: Const.vehicleRegistration.path.split('/').last,
          ),

        if (Const.insurance.path.isNotEmpty)
          'insurance': await MultipartFile.fromFile(
            Const.insurance.path,
            filename: Const.insurance.path.split('/').last,
          ),

        if (Const.profile.path.isNotEmpty)
          'profile_photo': await MultipartFile.fromFile(
            Const.profile.path,
            filename: Const.profile.path.split('/').last,
          ),
      });


      final response = await dioClient!.post(
        signUpEndPoint,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
        skipAuth: false,
      );

      return MessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }


/*===================================================================== change password API Call  ==========================================================*/

  Future resetPasswordApiCall({required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!
          .post(resetPasswordEndPoint, data: dataBody!, skipAuth: false);
      return MessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

/*===================================================================== update my_profile API Call  ==========================================================*/

  Future getProfileApi() async {
    try {
      final response = await dioClient!.get(myProfileEndPoint, skipAuth: false);
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

/*===================================================================== update my_profile API Call  ==========================================================*/

  Future updateProfileApiCall({required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!
          .put(editProfileEndPoint, data: dataBody!, skipAuth: false);
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

/*===================================================================== delete account API Call  ==========================================================*/

  Future deleteAccountApiCall({required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!
          .delete(deleteAccountEndPoint, data: dataBody!, skipAuth: false);
      return MessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

/*===================================================================== logout API Call  ==========================================================*/

  Future logoutApiCall() async {
    try {
      final response = await dioClient!.post(logoutEndPoint, skipAuth: false);
      return MessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }



  /*===================================================================== Check Email API Call  ==========================================================*/

  Future checkEmailApiCall({required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!
          .post(checkEmail, data: dataBody!, skipAuth: false);
      return MessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

}
