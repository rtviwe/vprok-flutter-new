import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:perek_main/base/data/db/settings.dart';
import 'package:perek_main/base/ui/theme/themes.dart';
import 'package:perek_main/base_main.dart';

final themeProvider = ChangeNotifierProvider(
  (ref) => ThemeNotifier(ref.read(settingsProvider)),
);

class ThemeNotifier with ChangeNotifier {
  ThemeNotifier(this.settings);

  Settings settings;

  ThemeData get data => settings.darkMode ? darkTheme : lightTheme;

  void switchBrightness() {
    settings.setDarkMode(!settings.darkMode);
    notifyListeners();
  }

  SystemUiOverlayStyle get systemTheme => SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: data.scaffoldBackgroundColor,
        systemNavigationBarDividerColor: data.scaffoldBackgroundColor,
        statusBarBrightness: data.brightness == Brightness.light ? Brightness.light : Brightness.dark,
        statusBarIconBrightness: data.brightness == Brightness.dark ? Brightness.light : Brightness.dark,
        systemNavigationBarIconBrightness: data.brightness == Brightness.dark ? Brightness.light : Brightness.dark,
      );

  List<BoxShadow> get boxShadow => [
        const BoxShadow(
          color: Color(0x0a000000),
          blurRadius: 4,
          offset: Offset(0, 4),
        ),
      ];

  Color get primary {
    return data.brightness == Brightness.light ? const Color(0xFF34BC48) : const Color(0xFF34BC48);
  }

  Color get primaryVariant {
    return data.brightness == Brightness.light ? const Color(0xFF99DDA3) : const Color(0xFF59DE83);
  }

  Color get promoted {
    return const Color(0xFFD661E8);
  }

  Color get info {
    return data.brightness == Brightness.light ? const Color(0xFF0A7BCC) : const Color(0xFF0F5499);
  }

  Color get accented {
    return const Color(0xFFFFD600);
  }

  Color get error {
    return const Color(0xFFFF6464);
  }

  Color get surfaceBackground {
    return data.brightness == Brightness.light ? const Color(0xFFFFFFFF) : const Color(0xFF192024);
  }

  Color get onSurfaceMain {
    return data.brightness == Brightness.light ? const Color(0xFFF7F7F7) : const Color(0xFF2A3136);
  }

  Color get surfaceAccent {
    return data.brightness == Brightness.light ? const Color(0xFFFFFFFF) : const Color(0xFF34414A);
  }

  Color get surfaceNative {
    return data.brightness == Brightness.light ? const Color(0xFFF2F2F2) : const Color(0xFF2A3136);
  }

  Color get surfaceVariant {
    return data.brightness == Brightness.light ? const Color(0xFFFFFFFF) : const Color(0xFF34414A);
  }

  Color get onSurfaceFirstPriority {
    return data.brightness == Brightness.light ? const Color(0xFFF4F5F6) : const Color(0xFF121214);
  }

  Color get onSurfaceHighEmphasis {
    return data.brightness == Brightness.light ? const Color(0xFF4F4E57) : const Color(0xFFC2CED1);
  }

  Color get onSurfaceMediumEmphasis {
    return data.brightness == Brightness.light ? const Color(0xFF807F8A) : const Color(0xFFA5AEB8);
  }

  Color get onSurfaceDisabled {
    return data.brightness == Brightness.light ? const Color(0xFFACAAB2) : const Color(0xFF828D99);
  }

  Color get onSurfaceOutline {
    return data.brightness == Brightness.light ? const Color(0xFFF7F7F7) : const Color(0xFF34414A);
  }

  Color get onSurfaceAccent {
    return const Color(0xFF121214);
  }
}
