import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:instagram_clone/common/endpoint/app_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:instagram_clone/exception/api_error_handler.dart';
import 'package:instagram_clone/exception/api_exception.dart';
import 'package:instagram_clone/features/camera/model/upload_response_model.dart';
import 'package:instagram_clone/features/detail_story/model/detail_story_model.dart';
import 'package:instagram_clone/features/home/model/story_model.dart';

class StoryService {
  final AppEndpoint _appEndpoint;
  final http.Client _client;

  StoryService({
    required AppEndpoint appEndpoint,
    required http.Client client,
  })  : _appEndpoint = appEndpoint,
        _client = client;

  Future<StoryResponse> getAllStories(
    String token, [
    int? page,
    int? size,
    int? location,
  ]) async {
    final url = _appEndpoint.getAllStories(location, size, page);

    final headers = {
      'Authorization': 'Bearer $token',
    };
    try {
      final response = await _client.get(url, headers: headers);

      final data = storyResponseFromJson(response.body);
      if (response.statusCode == 200) {
        return data;
      } else {
        throw ApiErrorHandler.handleError(
          statusCode: response.statusCode,
          error: data.message,
        );
      }
    } on SocketException catch (e) {
      throw ApiException(message: 'Internet eror $e');
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  Future<DetailStoryResponse> getDetailStory(String id, String token) async {
    final url = _appEndpoint.getDetailStories(id);
    final headers = {
      'Authorization': 'Bearer $token',
    };
    try {
      final response = await _client.get(url, headers: headers);
      final data = detailStoryResponseFromJson(response.body);
      if (response.statusCode == 200) {
        return data;
      } else {
        throw ApiErrorHandler.handleError(
          statusCode: response.statusCode,
          error: response.body,
        );
      }
    } on SocketException catch (e) {
      throw ApiException(message: 'Internet eror $e');
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  Future<UploadResponse> postStory(
    String token,
    List<int> bytes,
    String description,
    String fileName, [
    double? lat,
    double? lon,
  ]) async {
    final url = _appEndpoint.postStory();
    final request = http.MultipartRequest('POST', url);

    final multiPartFile = http.MultipartFile.fromBytes(
      'photo',
      bytes,
      filename: fileName,
    );

    final Map<String, String> fields = {
      "description": description,
    };

    if (lat != null) request.fields['lat'] = lat.toString();
    if (lon != null) request.fields['lon'] = lon.toString();

    final Map<String, String> headers = {
      'Content-type': 'multipart/form-data',
      'Authorization': 'Bearer $token',
    };

    request.files.add(multiPartFile);
    request.fields.addAll(fields);
    request.headers.addAll(headers);

    final streamedResponse = await request.send();
    final int statusCode = streamedResponse.statusCode;

    final Uint8List responseList = await streamedResponse.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);
    final uploadResponse = uploadResponseFromJson(responseData);

    if (statusCode == 201) {
      return uploadResponse;
    } else {
      throw ApiException(message: uploadResponse.message);
    }
  }

  factory StoryService.create() {
    return StoryService(
      appEndpoint: AppEndpoint.baseUrl(),
      client: http.Client(),
    );
  }
}
