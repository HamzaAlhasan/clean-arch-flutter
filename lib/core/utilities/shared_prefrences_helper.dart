import 'dart:convert';
import 'package:clean_arch_app/core/utilities/constant.dart';
import 'package:clean_arch_app/features/auth/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceHelper {
  static Future setData({required String key,required String value}) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future getData({required String key}) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getString(key);
  }

  static Future setDataModel({required String key,required dynamic value}) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(value));
  }

  static Future getDataModel({required String key}) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userData = prefs.getString(key);
    if (userData != null) {
      final Map<String, dynamic>? memberInfo = json.decode(userData);
      if (memberInfo != null) {
        return UserEntity.fromJson(memberInfo);
      }
    }
  }

static Future logOut() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(SharedKeys.userData);
  await prefs.remove(SharedKeys.accessToken);
  await prefs.remove(SharedKeys.refreshToken);
}

static void saveLoginTime() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('login_time', DateTime.now().millisecondsSinceEpoch);
}

static Future setAccessToken(String accessToken) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(SharedKeys.accessToken, accessToken);
}

static Future<String?> getAccessToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? accessToken =  prefs.getString(SharedKeys.accessToken);
  return accessToken;
}

static Future setRefreshToken(String refreshToken) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(SharedKeys.refreshToken, refreshToken);
}

static Future<String?> getRefreshToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
 String? refreshToken = prefs.getString(SharedKeys.refreshToken);
 return refreshToken;
}
}
