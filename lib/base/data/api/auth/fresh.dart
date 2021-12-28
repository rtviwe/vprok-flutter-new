import 'package:dio/dio.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:perek_main/base/constants.dart';
import 'package:perek_main/base/data/api/auth/dto.dart';
import 'package:perek_main/base/data/db/token_storage.dart';
import 'package:perek_main/base/data/json.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Fresh getFresh(
  SettingsTokenStorage storage,
) {
  return Fresh<OAuth2Token>(
    tokenStorage: storage,
    tokenHeader: (token) => {
      'Authorization': 'Bearer ${token.accessToken}',
    },
    httpClient: Dio(BaseOptions(baseUrl: Constants.url))
      ..interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      )),
    refreshToken: (token, dio) async {
      try {
        // TODO здесь надо добавить ключи для авторизации
        final response = await dio.post<Json>('v1/oauth/token');

        final tokenDto = TokenDto.fromJson(response.data ?? <String, dynamic>{});

        return OAuth2Token(
          accessToken: tokenDto.accessToken,
          refreshToken: tokenDto.refreshToken,
        );
      } on DioError {
        await storage.delete();
        return const OAuth2Token(accessToken: '', refreshToken: '');
      }
    },
  );
}
