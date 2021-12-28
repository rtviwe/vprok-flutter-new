import 'package:fresh/fresh.dart';
import 'package:perek_main/base/data/db/settings.dart';

class SettingsTokenStorage implements TokenStorage<OAuth2Token> {
  const SettingsTokenStorage({required this.settings});

  final Settings settings;

  @override
  Future<void> delete() async {
    await settings.setRefreshToken('');
    await settings.setAccessToken('');
  }

  @override
  Future<OAuth2Token> read() async {
    return OAuth2Token(
      accessToken: settings.accessToken ?? '',
      refreshToken: settings.refreshToken ?? '',
    );
  }

  @override
  Future<void> write(OAuth2Token token) async {
    await settings.setAccessToken(token.accessToken);
    await settings.setRefreshToken(token.refreshToken ?? '');
  }
}
