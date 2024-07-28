import 'dart:convert';

class RegisterResponse {
  final bool error;
  final String message;
  RegisterResponse({
    required this.error,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
      'message': message,
    };
  }

  factory RegisterResponse.fromMap(Map<String, dynamic> map) {
    return RegisterResponse(
      error: map['error'] as bool,
      message: map['message'] as String,
    );
  }

  factory RegisterResponse.fromJson(String source) =>
      RegisterResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
