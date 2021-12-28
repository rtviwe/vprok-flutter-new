import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:perek_main/app/page.dart';
import 'package:perek_main/base_main.dart';

Future main() async {
  await baseMain();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
