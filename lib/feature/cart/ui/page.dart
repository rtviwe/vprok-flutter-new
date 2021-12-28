import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:perek_main/base/ui/theme/provider.dart';

class CartPage extends HookConsumerWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            theme.switchBrightness();
          },
          child: const Text('Сменить тему'),
        ),
      ),
    );
  }
}
