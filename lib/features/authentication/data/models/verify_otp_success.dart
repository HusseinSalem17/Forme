class VerifyOtpSuccess {
  String message;

  VerifyOtpSuccess({required this.message});

  factory VerifyOtpSuccess.fromJson(Map<String, dynamic> json) {
    return VerifyOtpSuccess(
      message: json['message'],
    );
  }
}
