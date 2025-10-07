import 'package:get_storage/get_storage.dart';

class DataBase {
  static final _storage = GetStorage();

  static Future<void> write(String key, value) async {
    await _storage.write(key, value);
  }

  static Future<dynamic> read(String key) async {
    return await _storage.read(key);
  }

  static bool hasData(String key) {
    return _storage.hasData(key);
  }

  static Future<void> remove(String key) async {
    return await _storage.remove(key);
  }
}
