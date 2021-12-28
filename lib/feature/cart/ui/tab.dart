import 'package:flutter/cupertino.dart';
import 'package:perek_main/feature/cart/ui/page.dart';

final cartTabNavigatorKey = GlobalKey<NavigatorState>();

class CartTab extends StatelessWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'profile',
      key: cartTabNavigatorKey,
      onGenerateRoute: (settings) {
        return CupertinoPageRoute<dynamic>(
          settings: settings,
          builder: (context) {
            switch (settings.name) {
              case 'profile':
              case '/profile':
                return const CartPage();
              default:
                throw Exception('no route found for $settings');
            }
          },
        );
      },
    );
  }
}
