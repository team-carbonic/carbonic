import 'dart:math';

import 'package:dart_date/dart_date.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:sotwo/core/model/pagenation.dart';
import 'package:sotwo/core/network/custom_response.dart';
import 'package:sotwo/core/utility/time/time.dart';
import 'package:sotwo/feature/announcement/model/detail.dart';
import 'package:sotwo/feature/announcement/model/list.dart';

part 'list.g.dart';

@RestApi()
abstract class AnnouncementListRepository {
  factory AnnouncementListRepository(
    Dio dio,
  ) = _AnnouncementListRepository;

  @GET('/v1/notification_list')
  Future<CustomResponse<AnnouncementListModel>> getAnnouncementList({
    @Query('page') required final int page,
    @Query('size') required final int size,
    @Query('displayType') final String type = 'notification',
    @Query('partner') final String partner = 'sotwo',
  });

  // TODO: 서버 측 공지사항 API 작업 이후, 아래 함수 호출부를 getAnnouncementList 함수로 대체
  static Future<CustomResponse<AnnouncementListModel>> testGetAnnouncementList({
    required final int page,
    required final int size,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    final newSize = min(55 - page * size, size);
    return CustomResponse(
      data: AnnouncementListModel(
        pagenation: PagenationModel(
          totalPages: 3,
          totalElements: 55,
          pageNumber: page,
          pageSize: newSize,
        ),
        announcementDetails: List.generate(
          newSize,
          (index) => AnnouncementDetailModel(
            id: page * size + index + 1,
            title: '공지사항 ${page * size + index + 1}',
            imageUrl:
                'https://cdn.sotwo.com/img/dev/magazine/contents_20231026132704000625-00000009.jpg',
            message: '공지사항 내용 ${page * size + index + 1}\n'
                '공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용\n'
                '공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용 공지사항 내용',
            time: SabDateTime(
              data: DateTime.now().sub(
                const Duration(days: 5),
              ),
            ),
            externalLinkTitle: '외부 링크',
            externalLinkUrl: 'https://www.sotwo.com',
          ),
        ),
      ),
    );
  }
}
