part of 'upload_story_bloc.dart';

enum UploadStoryStatusState { initial, loading, success, failed }

class UploadStoryState {
  final String message;
  final UploadResponse? uploadResponse;
  final UploadStoryStatusState status;

  UploadStoryState({
    this.message = '',
    this.uploadResponse,
    this.status = UploadStoryStatusState.initial,
  });

  UploadStoryState copyWith({
    String? message,
    UploadResponse? uploadResponse,
    UploadStoryStatusState? status,
  }) {
    return UploadStoryState(
      message: message ?? this.message,
      uploadResponse: uploadResponse ?? this.uploadResponse,
      status: status ?? this.status,
    );
  }
}
