
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../utils/token_constance.dart';

class AuthHandler {
  final storage = const FlutterSecureStorage();

  Future<bool> saveAuthToken(String authData) async {
    try {
      await storage.write(key: lToken, value: authData);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> deleteAuthToken() async {
    await storage.delete(key: lToken);
  }

  Future<String> getAuthToken() async {
    var allValues = await storage.read(key: lToken);

    String resultAuth;
    if (allValues != null) {
      return allValues;
    } else {
      resultAuth = "";
      return resultAuth;
    }
  }
}