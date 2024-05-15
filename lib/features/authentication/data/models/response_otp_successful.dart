class ResponseOtpSuccessful {
  String message;

  ResponseOtpSuccessful({required this.message});

  factory ResponseOtpSuccessful.fromJson(Map<String, dynamic> json) {
    return ResponseOtpSuccessful(
      message: json['message'],
    );
  }
}
