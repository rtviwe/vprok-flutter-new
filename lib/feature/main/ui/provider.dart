import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:perek_main/base/view_model.dart';
import 'package:perek_main/feature/main/domain/interactor.dart';
import 'package:perek_main/feature/main/ui/event.dart';
import 'package:perek_main/feature/main/ui/state.dart';

final mainViewModelProvider = StateNotifierProvider<MainViewModel, ViewState>((ref) {
  return MainViewModel(
    mainScreenInteractor: ref.read(mainInteractorProvider),
  );
});

class MainViewModel extends BaseViewModel<ViewState, Event> {
  MainViewModel({
    required this.mainScreenInteractor,
  }) : super(const ViewState.loading());

  final MainScreenInteractor mainScreenInteractor;

  @override
  ViewState? reduce(Event event, ViewState previousState) {
    if (event is LoadEvent) {
      state = const ViewState.loading();
      mainScreenInteractor.getMainScreen().then((result) {
        result.either(
          (left) => {},
          (right) => processUiEvent(LoadFinished(data: right)),
        );
      });
    } else if (event is LoadFinished) {
      return ViewState.content(screenItemRemote: event.data);
    }
  }
}
