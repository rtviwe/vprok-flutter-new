import 'package:flutter/cupertino.dart';
import 'package:perek_main/feature/main/ui/page.dart';

final mainTabNavigatorKey = GlobalKey<NavigatorState>();

class MainTab extends StatelessWidget {
  const MainTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'main',
      key: mainTabNavigatorKey,
      onGenerateRoute: (settings) {
        return CupertinoPageRoute<dynamic>(
          settings: settings,
          builder: (context) {
            switch (settings.name) {
              case 'main':
              case '/main':
                return const MainPage();
              default:
                throw Exception('no route found for $settings');
            }
          },
        );
      },
    );
  }
}
