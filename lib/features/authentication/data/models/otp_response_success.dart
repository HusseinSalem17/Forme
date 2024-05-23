class OtpResponseSuccessful {
  String message;

  OtpResponseSuccessful({required this.message});

  factory OtpResponseSuccessful.fromJson(Map<String, dynamic> json) {
    return OtpResponseSuccessful(
      message: json['message'],
    );
  }
}