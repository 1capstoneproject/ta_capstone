import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends GetxService {
  late SharedPreferences _prefs;

  Future<SharedPreferencesService> init() async {
    _prefs = await SharedPreferences.getInstance();
    Get.printInfo(info: "Initialize SharePreferences");
    return this;
  }

  Future<void> saveString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Future<void> saveInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  Future<void> saveBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }

  final String _sessionUserIdKey = "session.userId.key";
  final String _sessionPasswordKey = "session.password.key";

  int get sessionUserIdKey => _prefs.getInt(_sessionUserIdKey) ?? 0;
  set sessionUserIdKey(int value) => _prefs.setInt(_sessionUserIdKey, value);

  String get sessionUserPassword => _prefs.getString(_sessionPasswordKey) ?? "";
  set sessionUserPassword(String value) =>
      _prefs.setString(_sessionPasswordKey, value);
}
