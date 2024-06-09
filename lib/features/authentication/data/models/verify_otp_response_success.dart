class VerifyOtpResponseSuccessModel {
  String message;

  VerifyOtpResponseSuccessModel({required this.message});

  factory VerifyOtpResponseSuccessModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponseSuccessModel(
      message: json['message'],
    );
  }
}
