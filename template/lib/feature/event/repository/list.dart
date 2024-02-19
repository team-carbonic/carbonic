import 'dart:math';

import 'package:dart_date/dart_date.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:sotwo/core/model/pagenation.dart';
import 'package:sotwo/core/network/custom_response.dart';
import 'package:sotwo/core/utility/time/time.dart';
import 'package:sotwo/feature/event/model/detail.dart';
import 'package:sotwo/feature/event/model/list.dart';

part 'list.g.dart';

@RestApi()
abstract class EventListRepository {
  factory EventListRepository(
    Dio dio,
  ) = _EventListRepository;

  @GET('/v1/notification_list')
  Future<CustomResponse<EventListModel>> getEventList({
    @Query('page') required final int page,
    @Query('size') required final int size,
    @Query('displayType') final String type = 'event',
    @Query('partner') final String partner = 'sotwo',
  });

  // TODO: 서버 측 공지사항 API 작업 이후, 아래 함수 호출부를 getEventList 함수로 대체
  static Future<CustomResponse<EventListModel>> testGetEventList({
    required final int page,
    required final int size,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    final newSize = min(55 - page * size, size);
    return CustomResponse(
      data: EventListModel(
        pagenation: PagenationModel(
          totalPages: 3,
          totalElements: 55,
          pageNumber: page,
          pageSize: newSize,
        ),
        eventDetails: List.generate(
          newSize,
          (index) => EventDetailModel(
            id: page * size + index + 1,
            title: '이벤트 ${page * size + index + 1}',
            imageUrl:
                'https://cdn.sotwo.com/img/dev/magazine/contents_20231026132704000625-00000009.jpg',
            message: '이벤트 내용 ${page * size + index + 1}\n'
                '이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용\n'
                '이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용 이벤트 내용',
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
