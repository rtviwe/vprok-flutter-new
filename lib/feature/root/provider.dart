import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:perek_main/feature/root/state.dart';

final rootStateProvider = StateNotifierProvider<RootStateProvider, ViewState>((_) => RootStateProvider());

class RootStateProvider extends StateNotifier<ViewState> {
  RootStateProvider() : super(const ViewState(selectedTabIndex: 0));

  void select(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }
}
