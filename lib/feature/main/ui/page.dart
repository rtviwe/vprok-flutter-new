import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:perek_main/feature/main/ui/content.dart';
import 'package:perek_main/feature/main/ui/event.dart';
import 'package:perek_main/feature/main/ui/provider.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainViewModelProvider);
    final viewModel = ref.watch(mainViewModelProvider.notifier);

    useEffect(() {
      viewModel.processUiEvent(const LoadEvent());
    }, const []);

    return state.map(
      content: (content) => MainContentScreen(content),
      loading: (_) => const Center(child: CircularProgressIndicator()),
    );
  }
}
