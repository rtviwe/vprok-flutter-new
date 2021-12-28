import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perek_main/base/data/api/block/details.dart';
import 'package:perek_main/base/data/api/block/pagination.dart';
import 'package:perek_main/base/data/api/block/screen_block_item.dart';

part 'screen.freezed.dart';

@freezed
class ScreenItemRemote with _$ScreenItemRemote {
  factory ScreenItemRemote({
    @JsonKey(name: 'screenCode') required String type,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'sections') required ScreenSectionsRemote sections,
  }) = _ScreenItemRemote;
}

@freezed
class ScreenSectionsRemote with _$ScreenSectionsRemote {
  factory ScreenSectionsRemote({
    @JsonKey(name: 'items') required List<ScreenBlockRemote> items,
    @JsonKey(name: 'pagination') PaginationRemote? pagination,
  }) = _ScreenSectionsRemote;
}

@freezed
class ScreenBlockRemote with _$ScreenBlockRemote {
  factory ScreenBlockRemote({
    @JsonKey(name: 'type') ScreenBlockTypes? type,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'details') DetailsRemote? details,
    @JsonKey(name: 'elements') BlockElementsRemote? elements,
  }) = _ScreenBlockRemote;
}

@freezed
class BlockElementsRemote with _$BlockElementsRemote {
  factory BlockElementsRemote({
    @JsonKey(name: 'items') required List<ScreenBlockItemRemote> items,
    @JsonKey(name: 'pagination') PaginationRemote? pagination,
  }) = _BlockElementsRemote;
}

enum ScreenBlockTypes {
  @JsonValue('banners')
  banners,
  @JsonValue('buttons')
  buttons,
  @JsonValue('brands')
  brands,
  @JsonValue('stories')
  stories,
  @JsonValue('categories')
  categories,
  @JsonValue('products')
  products,
  @JsonValue('orders')
  orders,
  @JsonValue('activeOrders')
  activeOrders,
  @JsonValue('historyOrders')
  historyOrders,
  @JsonValue('myProducts')
  myProducts,
  @JsonValue('productsCatalog')
  productsCatalog,
  @JsonValue('description')
  description,
  @JsonValue('single_banners')
  singleBanners,
  @JsonValue('list_banners')
  listBanners,
  @JsonValue('purchases')
  purchases,
  @JsonValue('promocode')
  promocode,
  @JsonValue('favoritesProducts')
  favoritesProducts,
  @JsonValue('filters')
  filters,
  @JsonValue('corners')
  corners,
  @JsonValue('catalog')
  catalog,
  @JsonValue('info')
  info,
  @JsonValue('listProducts')
  listProducts,
  @JsonValue('presentsProducts')
  presentsProducts,
  @JsonValue('loyaltyCard')
  loyaltyCard,
  @JsonValue('cartPromocode')
  cartPromocode,
  @JsonValue('cartBonuses')
  cartBonuses,
  @JsonValue('discountProducts')
  discountProducts,
  @JsonValue('buttonsWithPictures')
  buttonsWithPictures,
}
