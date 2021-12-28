import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:perek_main/base/data/api/block/deserializer.dart';
import 'package:perek_main/base/data/api/block/screen.dart';
import 'package:perek_main/base/data/json.dart';
import 'package:perek_main/base/either.dart';
import 'package:perek_main/base_main.dart';

final mainInteractorProvider = Provider<MainScreenInteractor>((ref) {
  return MainScreenInteractor(
    dio: ref.read(dioProvider),
  );
});

class MainScreenInteractor {
  const MainScreenInteractor({required this.dio});

  final Dio dio;

  Future<Either<Exception, ScreenItemRemote>> getMainScreen() {
    return attempt<ScreenItemRemote>(() async {
      final response = await dio.get<Json>('v5/screens/main');
      return ScreenDeserializer.parse(response.data!);
    });
  }
}
