import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:take_breath/_core/utils/filesToMultipart.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/community/models/community_detail.dart';
import 'package:take_breath/domain/community/models/community_list.dart';
import 'package:take_breath/domain/community/models/community_update.dart';
import 'package:take_breath/domain/community/models/community_write.dart';
import 'package:take_breath/domain/community/models/search_dto.dart';
import 'package:take_breath/domain/community/providers/search_dto_provider.dart';

class CommunityListPage {
  final List<CommunityList> content;
  final bool last;
  final int totalPages;
  final int totalElements;

  CommunityListPage({
    required this.content,
    required this.last,
    required this.totalPages,
    required this.totalElements,
  });

  factory CommunityListPage.fromJson(Map<String, dynamic> json) {
    final resp = json['response'];
    final List<dynamic> contentJson = resp['content'];
    return CommunityListPage(
      content: contentJson.map((e) => CommunityList.fromJson(e)).toList(),
      last: resp['last'] ?? true,
      totalPages: resp['totalPages'] ?? 1,
      totalElements: resp['totalElements'] ?? contentJson.length,
    );
  }
}

class CommunityRepository {
  Future<CommunityListPage> getList({
    SearchDto? searchDto,
    required int page,
    required int size,
  }) async {
    try {
      final effectiveSearchDto = searchDto ?? initialSearchDto;

      final Map<String, dynamic> queryParams = {
        if (effectiveSearchDto.keyword?.isNotEmpty ?? false)
          'keyword': effectiveSearchDto.keyword,
        if (effectiveSearchDto.categoryIds.isNotEmpty)
          'categoryIds': effectiveSearchDto.categoryIds.join(','),
        'sortType': effectiveSearchDto.sortType.name,
        'page': page,
        'size': size,
        'sort': '${effectiveSearchDto.sortType.name},DESC',
      };

      final response =
          await dio.get('/community/posts', queryParameters: queryParams);

      if (response.statusCode == 200) {
        return CommunityListPage.fromJson(response.data);
      } else {
        throw Exception('게시물 리스트 조회 실패');
      }
    } catch (e) {
      throw Exception("서버가 연결되어 있지 않습니다: $e");
    }
  }

  Future<CommunityDetail> getDetail(int id) async {
    try {
      final response = await dio.get(
        '/community/posts/$id',
      );
      if (response.statusCode == 200) {
        print("커뮤니티 상세 응답: ${response.data}");
        return CommunityDetail.fromJson(response.data['response']);
      } else {
        throw Exception("게시물 리스트 조회 실패: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("서버가 연결되어 있지 않습니다: $e");
    }
  }

  Future<void> save(CommunityWrite communityWrite) async {
    List<MultipartFile> files =
        await filesToMultipartFiles(communityWrite.images);

    FormData formData = FormData.fromMap({
      "saveDTO": jsonEncode({
        "title": communityWrite.title,
        "content": communityWrite.content,
        "categoryId": communityWrite.categoryId,
      }),
      "files": files,
    });

    try {
      final response = await dio.post(
        "/community/posts",
        data: formData,
      );
      if (response.statusCode == 200) {
        print("게시물 작성 성공 : ${response}");
      } else {
        throw Exception("작성실패 : ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("서버가 연결되어있지 않습니다 : $e");
    }
  }

  Future<void> update(CommunityUpdate communityUpdate, int id) async {
    List<MultipartFile> files =
        await filesToMultipartFiles(communityUpdate.images);

    FormData formData = FormData.fromMap({
      "updateDTO": jsonEncode({
        "title": communityUpdate.title,
        "content": communityUpdate.content,
        "categoryId": communityUpdate.categoryId,
        "deleteImageIds": communityUpdate.deleteImageIds,
      }),
      "files": files,
    });

    try {
      final response = await dio.put(
        "/community/posts/$id",
        data: formData,
      );
      if (response.statusCode == 200) {
        print("게시물 수정 성공 : ${response}");
      } else {
        throw Exception("작성실패 : ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("서버가 연결되어있지 않습니다 : $e");
    }
  }

  Future<String> deletePost(int id) async {
    try {
      final response = await dio.delete(
        '/community/posts/$id',
      );
      if (response.statusCode == 200) {
        print("커뮤니티 삭제 : ${response.data}");
        return response.data;
      } else {
        throw Exception("게시물 리스트 조회 실패: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("서버가 연결되어 있지 않습니다: $e");
    }
  }
}
