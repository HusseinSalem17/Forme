class ProfileDataUploadedSuccessfulModel {
  String message;

  ProfileDataUploadedSuccessfulModel({required this.message});

  factory ProfileDataUploadedSuccessfulModel.fromJson(Map<String, dynamic> json) {
    return ProfileDataUploadedSuccessfulModel(
      message: json['message'],
    );
  }
}