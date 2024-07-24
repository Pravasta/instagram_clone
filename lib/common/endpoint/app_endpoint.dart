import 'package:instagram_clone/common/endpoint/uri_helper.dart';

class AppEndpoint {
  final String _baseUrl;

  AppEndpoint({
    required String baseUrl,
  }) : _baseUrl = baseUrl;

  Uri register() {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: '/v1/register',
    );
  }

  Uri login() {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: '/v1/login',
    );
  }

  Uri getAllStories([int? location, int? size = 10, int? page = 1]) {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: '/v1/stories',
      querryParameters: {
        'location': location ?? 0,
        'size': size ?? 0,
        'page': page ?? 0,
      },
    );
  }

  Uri getDetailStories(String id) {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: '/v1/stories/$id',
    );
  }

  Uri postStory() {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: '/v1/stories',
    );
  }

  factory AppEndpoint.baseUrl() {
    return AppEndpoint(baseUrl: 'story-api.dicoding.dev');
  }
}
