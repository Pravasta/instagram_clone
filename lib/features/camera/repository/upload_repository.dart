import 'package:instagram_clone/exception/api_exception.dart';
import 'package:instagram_clone/features/camera/model/upload_response_model.dart';
import 'package:instagram_clone/service/story_service.dart';

abstract class UploadRepository {
  Future<UploadResponse> postStory(
      String token, List<int> bytes, String description, String fileName,
      [double? lat, double? lon]);
}

class UploadRepositoryImpl implements UploadRepository {
  final StoryService _service;

  UploadRepositoryImpl({required StoryService service}) : _service = service;

  @override
  Future<UploadResponse> postStory(
    String token,
    List<int> bytes,
    String description,
    String fileName, [
    double? lat,
    double? lon,
  ]) async {
    try {
      final call = await _service.postStory(
          token, bytes, description, fileName, lat, lon);
      return call;
    } catch (e) {
      print(e);
      throw ApiException(message: e.toString());
    }
  }

  factory UploadRepositoryImpl.create() {
    return UploadRepositoryImpl(service: StoryService.create());
  }
}
