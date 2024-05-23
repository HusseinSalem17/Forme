class TokenResponseSuccess {
  final String access;
  final String refresh;

  TokenResponseSuccess({
    required this.access,
    required this.refresh,
  });

  factory TokenResponseSuccess.fromJson(Map<String, dynamic> json) {
    return TokenResponseSuccess(
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
