class OtpResponseSuccessfulModel {
  String message;

  OtpResponseSuccessfulModel({required this.message});

  factory OtpResponseSuccessfulModel.fromJson(Map<String, dynamic> json) {
    return OtpResponseSuccessfulModel(
      message: json['message'],
    );
  }
}