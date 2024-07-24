import 'package:instagram_clone/exception/api_exception.dart';
import 'package:instagram_clone/features/detail_story/model/detail_story_model.dart';
import 'package:instagram_clone/service/story_service.dart';

abstract class DetailStoryRepository {
  Future<Story> getDetailStory(String id, String token);
}

class DetailStoryRepositoryImpl implements DetailStoryRepository {
  final StoryService _service;

  DetailStoryRepositoryImpl({
    required StoryService service,
  }) : _service = service;

  @override
  Future<Story> getDetailStory(String id, String token) async {
    try {
      final call = await _service.getDetailStory(id, token);
      return call.story;
    } on ApiException catch (e) {
      throw ApiException(message: e.message);
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  factory DetailStoryRepositoryImpl.create() {
    return DetailStoryRepositoryImpl(service: StoryService.create());
  }
}
