import 'dart:async';
import 'dart:developer';
import 'dart:io' show Platform;
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:perek_main/base/constants.dart';
import 'package:perek_main/base/data/api/auth/fresh.dart';
import 'package:perek_main/base/data/db/settings.dart';
import 'package:perek_main/base/data/db/token_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final settingsProvider = Provider(
  (_) => Settings(sharedPreferences: _sharedPreferences),
);

final dioProvider = Provider(
  (ref) => Dio(
    BaseOptions(
      baseUrl: Constants.url,
      headers: <String, dynamic>{
        // TODO здесь надо добавить хедеры необходимые
      },
    ),
  )..interceptors.addAll([
      getFresh(SettingsTokenStorage(settings: ref.read(settingsProvider))),
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    ]),
);

late SharedPreferences _sharedPreferences;
late String _version;
AndroidDeviceInfo? _androidDeviceInfo;
IosDeviceInfo? _iosDeviceInfo;

Future baseMain() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  _sharedPreferences = await SharedPreferences.getInstance();

  if (!kIsWeb) {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      _androidDeviceInfo = await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      _iosDeviceInfo = await deviceInfo.iosInfo;
    }

    final packageInfo = await PackageInfo.fromPlatform();
    _version = packageInfo.version;
  } else {
    _version = '1.0.0';
  }
}
