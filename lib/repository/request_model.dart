class RequestModel {

/*===================================================login Request Model==============================================*/
  static loginRequestModel({
    required String? email,
    required String? password,
    required String? role,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    data["role"] = role;
    return data;
  }

/*===================================================signup Request Model==============================================*/
  static signupRequestModel({
    required String? email,
    required String? phoneCode,
    required String? firstName,
    required String? lastName,
    required String? phoneNumber,
    required String? password,
    required String? confirmPassword,
    required String? role,
    String? referralCOde,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["phone_code"] = phoneCode;
    data["first_name"] = firstName;
    data["last_name"] = lastName;
    data["phone_number"] = phoneNumber;
    data["password"] = password;
    data["password_confirmation"] = confirmPassword;
    data["role"] = role;
    data["referral_code"] = referralCOde;
    return data;
  }

/*===================================================request otp Request Model==============================================*/
  static requestOtpRequestModel({
    required String? email,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    return data;
  }

/*===================================================verify otp Request Model==============================================*/
  static verifyOtpRequestModel({
    required String? email,
    required String? otp,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["otp"] = otp;
    return data;
  }

/*===================================================reset password Request Model==============================================*/
  static resetPasswordRequestModel({
    required String? token,
    required String? password,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["token"] = token;
    data["password"] = password;
    return data;
  }

/*=================================================== delete account Request Model==============================================*/
  static deleteAccountRequestModel({
    required String? currentPassword,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["password"] = currentPassword;
    return data;
  }

/*=================================================== update profile Request Model==============================================*/
  static updateProfileRequestModel({
    required String? name,
    required String? phoneNumber,
    required String? countryCode,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["phoneNumber"] = phoneNumber;
    data["countryCode"] = countryCode;
    return data;
  }

/*=================================================== create booking Request Model==============================================*/
  static createBookingRequestModel({
    required String? boardingLocationId,
    required String? landingLocationId,
    required String? startTime,
    required String? endTime,
    required int? passengers,
    required String? dayOfWeek,
    required String? dateOfTravel,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["boardingLocationId"] = boardingLocationId;
    data["landingLocationId"] = landingLocationId;
    data["startTime"] = startTime;
    data["endTime"] = endTime;
    data["passengers"] = passengers;
    data["dayOfWeek"] = dayOfWeek;
    data["dateOfTravel"] = dateOfTravel;
    return data;
  }

/*=================================================== update payment Request Model==============================================*/
  static updatePaymentRequestModel({
    required String? bookingId,
    required String? paymentId,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["bookingId"] = bookingId;
    data["paymentId"] = paymentId;
    return data;
  }
}
