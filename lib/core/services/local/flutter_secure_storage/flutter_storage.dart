import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  static FlutterSecureStorage? storage;

  static setSecureData(String key, String value) async {
    await storage?.write(
      key: key,
      value: value,
    );
  }

  static getSecureData(String key) async {
    return await storage?.read(key: key);
  }

  static delSecureData(String key) async {
    await storage?.delete(key: key);
  }

  static delAllSecureData() async {
    await storage?.deleteAll();
  }
}
