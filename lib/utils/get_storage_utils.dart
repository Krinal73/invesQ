import 'package:get_storage/get_storage.dart';

const kStayLogin = 'kStayLogin';
const kAuthorizationToken = 'kAuthorizationToken';
const kRefreshToken = 'kRefreshToken';
const kUserResponseModel = 'kUserResponseModel';

class GetStorageUtils {
  static GetStorage get storage => GetStorage();

  static Future<void> remove(String key) async {
    final box = GetStorage();
    await box.remove(key);
  }

  static void setString(String key, String value) {
    storage.write(key, value);
  }

  static Future<String> getString(String key, String defaultValue) async {
    return await storage.read(key) ?? defaultValue;
  }

  static void setStringList(String key, List<String> values) {
    storage.write(key, values);
  }

  static Future<List<String>> getStringList(String key) async {
    return storage.read(key);
  }

  static void setInt(String key, int value) {
    storage.write(key, value);
  }

  static Future<int> getInt(String key, int defaultValue) async {
    return await storage.read(key) ?? defaultValue;
  }

  static void setDouble(String key, double value) {
    storage.write(key, value);
  }

  static Future<double> getDouble(String key, double defaultValue) async {
    return await storage.read(key) ?? defaultValue;
  }

  static void setBoolean(String key, bool value) {
    storage.write(key, value);
  }

  static Future<bool> getBoolean(String key, bool defaultValue) async {
    return await storage.read(key) ?? defaultValue;
  }

  static Future<void> clearStorage() async {
    return storage.erase();
  }
}
