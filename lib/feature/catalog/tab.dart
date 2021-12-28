import 'package:flutter/cupertino.dart';
import 'package:perek_main/feature/catalog/page.dart';

final catalogTabNavigatorKey = GlobalKey<NavigatorState>();

class CatalogTab extends StatelessWidget {
  const CatalogTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'catalog',
      key: catalogTabNavigatorKey,
      onGenerateRoute: (settings) {
        return CupertinoPageRoute<dynamic>(
          settings: settings,
          builder: (context) {
            switch (settings.name) {
              case 'catalog':
              case '/catalog':
                return const CatalogPage();
              default:
                throw Exception('no route found for $settings');
            }
          },
        );
      },
    );
  }
}
