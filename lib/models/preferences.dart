import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Preferences {
  static final Preferences _instance = Preferences._internal();

  factory Preferences() => _instance;

  Preferences._internal();

  FlutterSecureStorage storage = new FlutterSecureStorage();

  //AccessToken
  Future<String> getAccessToken() async {
    String? accessToken = await storage.read(key: 'accessToken');
    return accessToken ?? "";
  }

  Future<void> setAccessToken(String value) async {
    await storage.write(key: 'accessToken', value: value);
  }
}
