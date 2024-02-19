import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagenation.freezed.dart';
part 'pagenation.g.dart';

@freezed
class PagenationModel with _$PagenationModel {
  factory PagenationModel({
    @JsonKey(name: 'totalPages') required final int totalPages,
    @JsonKey(name: 'totalElements') required final int totalElements,
    @JsonKey(name: 'pageNumber') required final int pageNumber,
    @JsonKey(name: 'itemSize') required final int pageSize,
  }) = _PagenationModel;

  factory PagenationModel.fromJson(Map<String, dynamic> json) =>
      _$PagenationModelFromJson(json);
}
