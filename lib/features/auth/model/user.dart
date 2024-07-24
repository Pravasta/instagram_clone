import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  bool error;
  String message;
  LoginResult? loginResult;

  UserResponse({
    required this.error,
    required this.message,
    required this.loginResult,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        error: json["error"],
        message: json["message"],
        loginResult: json["loginResult"] == null
            ? null
            : LoginResult.fromJson(json["loginResult"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "loginResult": loginResult?.toJson(),
      };
}

class LoginResult {
  String userId;
  String name;
  String token;

  LoginResult({
    required this.userId,
    required this.name,
    required this.token,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) => LoginResult(
        userId: json["userId"],
        name: json["name"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "token": token,
      };

  LoginResult copyWith({
    String? userId,
    String? name,
    String? token,
  }) {
    return LoginResult(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      token: token ?? this.token,
    );
  }
}
