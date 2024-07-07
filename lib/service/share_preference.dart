import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends GetxService {
  late SharedPreferences _prefs;

  Future<SharedPreferencesService> init() async {
    _prefs = await SharedPreferences.getInstance();
    Get.printInfo(info: "Initialize SharePreferences");
    return this;
  }

  // buat key sessi api key.
  final String _sessionApiKeys = "session.api.key";

  // getter dan setter buat session api key
  String get sessionApiKeys => _prefs.getString(_sessionApiKeys) ?? "";
  set sessionApiKeys(String value) => _prefs.setString(_sessionApiKeys, value);

  // create function to delete all session
  Future<void> deleteSession() async {
    await _prefs.clear();
  }

  // create function to remove some keys
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }
}
