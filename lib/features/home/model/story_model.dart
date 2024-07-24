import 'dart:convert';

StoryResponse storyResponseFromJson(String str) =>
    StoryResponse.fromJson(json.decode(str));

String storyResponseToJson(StoryResponse data) => json.encode(data.toJson());

class StoryResponse {
  bool error;
  String message;
  List<ListStory>? listStory;

  StoryResponse({
    required this.error,
    required this.message,
    required this.listStory,
  });

  factory StoryResponse.fromJson(Map<String, dynamic> json) => StoryResponse(
        error: json["error"],
        message: json["message"],
        listStory: json["listStory"] == null
            ? []
            : List<ListStory>.from(
                json["listStory"].map((x) => ListStory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "listStory": listStory == null
            ? []
            : List<dynamic>.from(listStory!.map((x) => x.toJson())),
      };
}

class ListStory {
  String id;
  String name;
  String description;
  String photoUrl;
  DateTime createdAt;
  double? lat;
  double? lon;

  ListStory({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.createdAt,
    required this.lat,
    required this.lon,
  });

  factory ListStory.fromJson(Map<String, dynamic> json) => ListStory(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        photoUrl: json["photoUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        lat: json['lat'] == null ? null : json["lat"]?.toDouble(),
        lon: json['lon'] == null ? null : json["lon"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "photoUrl": photoUrl,
        "createdAt": createdAt.toIso8601String(),
        "lat": lat,
        "lon": lon,
      };
}
