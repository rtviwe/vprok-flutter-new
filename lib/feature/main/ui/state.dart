import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perek_main/base/data/api/block/screen.dart';

part 'state.freezed.dart';

@freezed
class ViewState with _$ViewState {
  const factory ViewState.content({
    required ScreenItemRemote screenItemRemote,
  }) = ContentState;

  const factory ViewState.loading() = LoadingState;
}
