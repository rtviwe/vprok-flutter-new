import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:perek_main/base/ui/scroll_behavior.dart';
import 'package:perek_main/base/ui/theme/provider.dart';
import 'package:perek_main/feature/root/page.dart';

class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(theme.systemTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'root',
      theme: theme.data,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: child ?? const SizedBox.shrink(),
        );
      },
      onGenerateRoute: (settings) {
        return CupertinoPageRoute<dynamic>(
          settings: settings,
          builder: (context) {
            switch (settings.name) {
              case 'root':
              case '/root':
                return const RootPage();
              default:
                throw Exception('no route found for $settings');
            }
          },
        );
      },
    );
  }
}
