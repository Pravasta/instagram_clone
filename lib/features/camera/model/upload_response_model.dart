import 'dart:convert';

UploadResponse uploadResponseFromJson(String str) =>
    UploadResponse.fromJson(json.decode(str));

String uploadResponseToJson(UploadResponse data) => json.encode(data.toJson());

class UploadResponse {
  bool error;
  String message;

  UploadResponse({
    required this.error,
    required this.message,
  });

  factory UploadResponse.fromJson(Map<String, dynamic> json) => UploadResponse(
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
      };
}
