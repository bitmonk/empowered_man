class SignupRequestModel {
  SignupRequestModel(
      {this.occupation,
      this.phoneNumber,
      this.fullName,
      this.password,
      this.email,});

  String? fullName;
  String? occupation;
  String? phoneNumber;
  String? email;
  String? password;

  Map<String, dynamic> toMap() {
    return {
      'full_name': fullName,
      'email': email,
      'password': password,
      'confirmed_password': password,
      if (occupation != null) 'occupation': occupation,
      if (phoneNumber != null) 'phone_number': phoneNumber,
    };
  }
}
