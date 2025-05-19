class LoginResponseModel {
  bool? success;
  String? message;
  LoginDataModel? data;

  LoginResponseModel({this.success, this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new LoginDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginDataModel {
  int? id;
  String? firstName;
  String? lastName;
  String? name;
  String? email;
  String? phoneCode;
  String? phoneNumber;
  String? emailVerifiedAt;
  String? referralCode;
  String? referBy;
  String? role;
  String? address;
  String? createdAt;
  String? updatedAt;
  String? token;

  LoginDataModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.name,
        this.email,
        this.phoneCode,
        this.phoneNumber,
        this.emailVerifiedAt,
        this.referralCode,
        this.referBy,
        this.role,
        this.address,
        this.createdAt,
        this.updatedAt,
        this.token});

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    name = json['name'];
    email = json['email'];
    phoneCode = json['phone_code'];
    phoneNumber = json['phone_number'];
    emailVerifiedAt = json['email_verified_at'];
    referralCode = json['referral_code'];
    referBy = json['refer_by'];
    role = json['role'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['name'] = name;
    data['email'] = email;
    data['phone_code'] = phoneCode;
    data['phone_number'] = phoneNumber;
    data['email_verified_at'] = emailVerifiedAt;
    data['referral_code'] = referralCode;
    data['refer_by'] = referBy;
    data['role'] = role;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['token'] = token;
    return data;
  }
}
