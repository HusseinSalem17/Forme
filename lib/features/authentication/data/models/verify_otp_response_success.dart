class VerifyOtpResponseSuccess {
  String message;

  VerifyOtpResponseSuccess({required this.message});

  factory VerifyOtpResponseSuccess.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponseSuccess(
      message: json['message'],
    );
  }
}
