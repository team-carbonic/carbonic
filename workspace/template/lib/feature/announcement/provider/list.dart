import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sotwo/core/network/custom_response.dart';
import 'package:sotwo/feature/announcement/model/detail.dart';
import 'package:sotwo/feature/announcement/model/list.dart';
import 'package:sotwo/feature/announcement/repository/list.dart';

part 'list.g.dart';

@riverpod
class AnnouncementList extends _$AnnouncementList {
  static const pageSize = 20;

  var _isFetchingMore = false;

  @override
  Future<AnnouncementListModel> build() async => (await _getPage(0)).data!;

  Future<void> fetchMore() async {
    if (_isFetchingMore) {
      return;
    }
    _isFetchingMore = true;
    await _fetchMoreImplementation();
    _isFetchingMore = false;
  }

  Future<void> _fetchMoreImplementation() async {
    final data = state.value;
    if (data == null) {
      ref.invalidateSelf();
      return;
    }

    final nextPageNumber = data.pagenation.pageNumber + 1;
    if (nextPageNumber >= data.pagenation.totalPages) {
      return;
    }

    state = await AsyncValue.guard(() async {
      final response = await _getPage(nextPageNumber);
      // TODO : CustomResponse가 명확히 정의된 이후, 결과가 null인 경우에 대한 예외처리 방식이 변경될 수 있음
      final nextPageData = response.data!;
      return data.copyWith(
        pagenation: nextPageData.pagenation,
        announcementDetails: [
          ...data.announcementDetails,
          ...nextPageData.announcementDetails,
        ],
      );
    });
  }

  Future<CustomResponse<AnnouncementListModel>> _getPage(
    final int pageNumber,
  ) =>
      // TODO : 서버 측 API 작업 이후 수정 필요, 아래는 테스트 코드
      // AnnouncementListRepository(
      //   DioClient(baseUrl: F.flavor.serverUrl),
      // ).getAnnouncementList(page: pageNumber, size: 20);
      AnnouncementListRepository.testGetAnnouncementList(
        page: pageNumber,
        size: pageSize,
      );

  AnnouncementDetailModel? getDetail(final int id) =>
      state.value?.announcementDetails
          .firstWhereOrNull((element) => element.id == id);
}
