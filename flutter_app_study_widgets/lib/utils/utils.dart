import 'dart:convert';
import 'package:flutter/widgets.dart';
import '../generated/json/base/json_convert_content.dart';
import '../model/login_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static const String LoginKey = "loginkey";

  static SharedPreferences? _prefs;

  static saveLogin(LoginEntity loginEntity) {
    if (loginEntity != null && (loginEntity is LoginEntity)) {
      _prefs?.setString(LoginKey, json.encode(loginEntity.toJson()));
    }
  }

  static LoginEntity? getLogin() {
    String loginJsonString = _prefs?.getString(LoginKey) ?? "";
    if (loginJsonString != null &&
        (loginJsonString is String) &&
        loginJsonString.length > 0) {
      LoginEntity loginEntity =
      JsonConvert.fromJsonAsT<LoginEntity>(jsonDecode(loginJsonString));
      return loginEntity;
    }
    return null;
  }

  static bool get isLogin{
    if (Global.getLogin() != null){
      return true;
    }
    return false;
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }
}

class ColorUtil {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color fromArgb(double a, int r, int g, int b) {
    int alpha = (255 * a).toInt();
    return Color.fromARGB(alpha, r, g, b);
  }
}
