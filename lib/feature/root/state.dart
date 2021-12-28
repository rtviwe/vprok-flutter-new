import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class ViewState with _$ViewState {
  const factory ViewState({
    required int selectedTabIndex,
  }) = _ViewState;
}
