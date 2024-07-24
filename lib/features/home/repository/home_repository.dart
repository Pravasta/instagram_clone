import 'package:instagram_clone/exception/api_exception.dart';
import 'package:instagram_clone/features/home/model/story_model.dart';
import 'package:instagram_clone/service/story_service.dart';

abstract class HomeRepository {
  Future<List<ListStory>?> getAllStory(String token,
      [int? page, int? size, int? location]);
}

class HomeRepositoryImpl implements HomeRepository {
  final StoryService _service;

  HomeRepositoryImpl({
    required StoryService service,
  }) : _service = service;

  @override
  Future<List<ListStory>?> getAllStory(String token,
      [int? page, int? size, int? location]) async {
    try {
      final call = await _service.getAllStories(token, page, size);
      if (call.listStory!.isEmpty) {
        throw ApiException(message: call.message);
      }
      return call.listStory;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  factory HomeRepositoryImpl.create() {
    return HomeRepositoryImpl(service: StoryService.create());
  }
}
