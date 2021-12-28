import 'package:perek_main/base/data/api/block/screen.dart';

class Event {
  const Event();
}

class LoadEvent extends Event {
  const LoadEvent();
}

class LoadFinished extends Event {
  const LoadFinished({required this.data});

  final ScreenItemRemote data;
}
