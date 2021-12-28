import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseViewModel<VIEW_STATE, EVENT> extends StateNotifier<VIEW_STATE> {
  BaseViewModel(VIEW_STATE state) : super(state);

  VIEW_STATE? reduce(EVENT event, VIEW_STATE previousState);

  void processUiEvent(EVENT event) {
    final newViewState = reduce(event, state);
    if (newViewState != null && newViewState != state) {
      state = newViewState;
    }
  }
}
