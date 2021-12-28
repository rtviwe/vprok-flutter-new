import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

@freezed
class PaginationRemote with _$PaginationRemote {
  factory PaginationRemote({
    @JsonKey(name: 'perPage') required int perPage,
    @JsonKey(name: 'currentPage') required int currentPage,
    @JsonKey(name: 'totalPages') required int totalPages,
  }) = _PaginationRemote;

  factory PaginationRemote.fromJson(Map<String, dynamic> json) => _$PaginationRemoteFromJson(json);
}
