part of 'upload_story_bloc.dart';

@immutable
sealed class UploadStoryEvent {}

class OnUploadStory extends UploadStoryEvent {
  final String? description;
  final List<int> bytes;
  final String fileName;
  final double? lat;
  final double? lon;

  OnUploadStory({
    required this.description,
    required this.bytes,
    required this.fileName,
    this.lat,
    this.lon,
  });
}
