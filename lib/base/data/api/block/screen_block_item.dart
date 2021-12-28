import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perek_main/base/data/api/block/details.dart';

part 'screen_block_item.freezed.dart';
part 'screen_block_item.g.dart';

@freezed
class ScreenBlockItemRemote with _$ScreenBlockItemRemote {
  factory ScreenBlockItemRemote.banner({
    @JsonKey(name: 'image') required String image,
    @JsonKey(name: 'details') DetailsRemote? details,
  }) = BannerRemote;

  factory ScreenBlockItemRemote.corner({
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'headers') required CornerHeaderRemote headers,
    @JsonKey(name: 'isSelected') required bool isSelected,
    @JsonKey(name: 'color') required String color,
  }) = CornerRemote;

  factory ScreenBlockItemRemote.products({
    @JsonKey(name: 'productId') required int productId,
    @JsonKey(name: 'promoId') int? promoId,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'brightLabel') BrightLabelRemote? brightLabelRemote,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'price') required double price,
    @JsonKey(name: 'oldPrice') double? oldPrice,
    @JsonKey(name: 'discount') int? discount,
    @JsonKey(name: 'amountFree') required double amountFree,
    @JsonKey(name: 'fractionTextRound') required String fractionTextRound,
    @JsonKey(name: 'fraction') required double fraction,
    @JsonKey(name: 'fractionText') required String fractionText,
    @JsonKey(name: 'quantum') required double quantum,
    @JsonKey(name: 'isActive') required bool isActive,
    @JsonKey(name: 'isQuantSelectable') required bool isQuantSelectable,
    @JsonKey(name: 'quantImage') String? quantImage,
    @JsonKey(name: 'priceQuant') double? priceQuant,
    @JsonKey(name: 'oldPriceQuant') double? oldPriceQuant,
    @JsonKey(name: 'discountQuant') int? discountQuant,
    @JsonKey(name: 'packingQuantum') double? packingQuantum,
    @JsonKey(name: 'adultsOnly') required bool adultsOnly,
    @JsonKey(name: 'isAlcohol') required bool isAlcohol,
    @JsonKey(name: 'minProductDeliveryDate') String? minProductDeliveryDate,
    @JsonKey(name: 'timestampMinProductDeliveryDate') int? timestampMinProductDeliveryDate,
    @JsonKey(name: 'showQuantByDefault') required bool showQuantByDefault,
    @JsonKey(name: 'productInfoMessage') String? disclaimer,
    @JsonKey(name: 'kitProducts') List<ProductsRemote>? kitProducts,
    @JsonKey(name: 'supplierName') String? supplierName,
  }) = ProductsRemote;

  factory ScreenBlockItemRemote.button({
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'type') required String type,
  }) = ButtonRemote;

  factory ScreenBlockItemRemote.fromJson(Map<String, dynamic> json) => _$ScreenBlockItemRemoteFromJson(json);
}

@freezed
class CornerHeaderRemote with _$CornerHeaderRemote {
  factory CornerHeaderRemote({
    @JsonKey(name: 'X-Data-Corner-Id') required String cornerId,
  }) = _CornerHeaderRemote;

  factory CornerHeaderRemote.fromJson(Map<String, dynamic> json) => _$CornerHeaderRemoteFromJson(json);
}

@freezed
class BrightLabelRemote with _$BrightLabelRemote {
  factory BrightLabelRemote({
    @JsonKey(name: 'color') required String color,
    @JsonKey(name: 'title') required String title,
  }) = _BrightLabelRemote;

  factory BrightLabelRemote.fromJson(Map<String, dynamic> json) => _$BrightLabelRemoteFromJson(json);
}
