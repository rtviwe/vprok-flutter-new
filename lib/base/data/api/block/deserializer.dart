import 'package:collection/collection.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:perek_main/base/data/api/block/details.dart';
import 'package:perek_main/base/data/api/block/pagination.dart';
import 'package:perek_main/base/data/api/block/screen.dart';
import 'package:perek_main/base/data/api/block/screen_block_item.dart';
import 'package:perek_main/base/data/json.dart';

/// Use `await ScreenDeserializer.parse(response.data)`
class ScreenDeserializer {
  static ScreenItemRemote _parse(Json json) {
    final sections = json['sections'] as Json;

    return ScreenItemRemote(
      type: json['screenCode'] as String,
      title: json['title'] as String?,
      sections: ScreenSectionsRemote(
        pagination: sections['pagination'] != null ? PaginationRemote.fromJson(sections['pagination'] as Json) : null,
        items: (sections['items'] as List<dynamic>).map((dynamic items) {
          items as Json;

          final type = EnumToString.fromString(ScreenBlockTypes.values, items['type'] as String)!;
          final pagination =
              items['pagination'] != null ? PaginationRemote.fromJson(items['pagination'] as Json) : null;
          final details = items['details'] != null ? DetailsRemote.fromJson(items['details'] as Json) : null;
          final title = items['title'] as String;
          final description = items['description'] as String?;
          final elements = items['elements'] as Json;

          return ScreenBlockRemote(
            type: type,
            title: title,
            description: description,
            details: details,
            elements: BlockElementsRemote(
              pagination: pagination,
              items: (elements['items'] as List<dynamic>)
                  .map<ScreenBlockItemRemote?>((dynamic element) {
                    element as Json;

                    switch (type) {
                      case ScreenBlockTypes.banners:
                        return BannerRemote.fromJson(element);
                      case ScreenBlockTypes.corners:
                        return CornerRemote.fromJson(element);
                      case ScreenBlockTypes.products:
                        return ProductsRemote.fromJson(element);
                      case ScreenBlockTypes.buttons:
                        return ButtonRemote.fromJson(element);
                      default:
                        return null;
                    }
                  })
                  .whereNotNull()
                  .toList(),
            ),
          );
        }).toList(),
      ),
    );
  }

  static Future<ScreenItemRemote> parse(Map<String, dynamic> json) async {
    return compute<Map<String, dynamic>, ScreenItemRemote>(_parse, json);
  }
}
