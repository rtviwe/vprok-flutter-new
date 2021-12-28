import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:perek_main/base/ui/theme/provider.dart';
import 'package:perek_main/feature/cart/ui/tab.dart';
import 'package:perek_main/feature/catalog/tab.dart';
import 'package:perek_main/feature/main/ui/tab.dart';
import 'package:perek_main/feature/root/provider.dart';

final _navigatorKeys = [
  mainTabNavigatorKey,
  catalogTabNavigatorKey,
  cartTabNavigatorKey,
];

class RootPage extends HookConsumerWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(rootStateProvider.notifier);
    final state = ref.watch(rootStateProvider);
    final theme = ref.watch(themeProvider);

    return WillPopScope(
      onWillPop: () async {
        final currentState = _navigatorKeys[state.selectedTabIndex].currentState;
        if (currentState?.canPop() ?? false) {
          currentState?.pop(_navigatorKeys[state.selectedTabIndex].currentContext);
          return false;
        } else {
          await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: theme.onSurfaceFirstPriority,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: theme.surfaceAccent,
          selectedItemColor: theme.primary,
          selectedFontSize: 12,
          currentIndex: state.selectedTabIndex,
          onTap: provider.select,
          items: [
            BottomNavigationBarItem(
              label: 'Главная',
              icon: SvgPicture.asset(
                'assets/icons/ic_logo.svg',
                color: state.selectedTabIndex == 0 ? theme.primary : theme.onSurfaceMediumEmphasis,
                width: 24,
                height: 24,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Каталог',
              icon: SvgPicture.asset(
                'assets/icons/ic_catalog.svg',
                color: state.selectedTabIndex == 1 ? theme.primary : theme.onSurfaceMediumEmphasis,
                width: 24,
                height: 24,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Корзина',
              icon: SvgPicture.asset(
                'assets/icons/ic_cart.svg',
                color: state.selectedTabIndex == 2 ? theme.primary : theme.onSurfaceMediumEmphasis,
                width: 24,
                height: 24,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Акции',
              icon: SvgPicture.asset(
                'assets/icons/ic_bonuses.svg',
                color: state.selectedTabIndex == 3 ? theme.primary : theme.onSurfaceMediumEmphasis,
                width: 24,
                height: 24,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Профиль',
              icon: SvgPicture.asset(
                'assets/icons/ic_profile.svg',
                color: state.selectedTabIndex == 4 ? theme.primary : theme.onSurfaceMediumEmphasis,
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
        body: IndexedStack(
          index: state.selectedTabIndex,
          children: [
            const MainTab(),
            const CatalogTab(),
            const CartTab(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
