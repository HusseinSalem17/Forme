class TokenResponseSuccessModel {
  final String access;
  final String refresh;

  TokenResponseSuccessModel({
    required this.access,
    required this.refresh,
  });

  factory TokenResponseSuccessModel.fromJson(Map<String, dynamic> json) {
    return TokenResponseSuccessModel(
      access: json['access'],
      refresh: json['refresh'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access': access,
      'refresh': refresh,
    };
  }
}
