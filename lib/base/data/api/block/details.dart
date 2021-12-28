import 'package:freezed_annotation/freezed_annotation.dart';

part 'details.freezed.dart';
part 'details.g.dart';

@freezed
class DetailsRemote with _$DetailsRemote {
  factory DetailsRemote({
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'route') required RouteRemote route,
  }) = _DetailsRemote;

  factory DetailsRemote.fromJson(Map<String, dynamic> json) => _$DetailsRemoteFromJson(json);
}

@freezed
class RouteRemote with _$RouteRemote {
  factory RouteRemote({
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'value') required RouteValueRemote value,
  }) = _RouteRemote;

  factory RouteRemote.fromJson(Map<String, dynamic> json) => _$RouteRemoteFromJson(json);
}

@freezed
class RouteValueRemote with _$RouteValueRemote {
  factory RouteValueRemote({
    @JsonKey(name: 'categoryId') int? categoryId,
    @JsonKey(name: 'productId') int? productId,
    @JsonKey(name: 'tabId') String? tabId,
    @JsonKey(name: 'promoId') int? promoId,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'search') String? search,
    @JsonKey(name: 'items') String? items,
    @JsonKey(name: 'promocode') String? promocode,
  }) = _RouteValueRemote;

  factory RouteValueRemote.fromJson(Map<String, dynamic> json) => _$RouteValueRemoteFromJson(json);
}
