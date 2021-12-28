import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin SingleEventMixin<E, S> on StateNotifier<S> {
  final _singleEventsController = StreamController<E>.broadcast();

  Stream<E> get singleEvents => _singleEventsController.stream;

  @override
  Future<void> dispose() async {
    await _singleEventsController.close();
    super.dispose();
  }

  void send(E event) {
    _singleEventsController.add(event);
  }
}
