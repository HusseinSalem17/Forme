class SetNewPasswordSuccessModel {
  String message;

  SetNewPasswordSuccessModel({required this.message});

  factory SetNewPasswordSuccessModel.fromJson(Map<String, dynamic> json) {
    return SetNewPasswordSuccessModel(
      message: json['message'],
    );
  }
}
