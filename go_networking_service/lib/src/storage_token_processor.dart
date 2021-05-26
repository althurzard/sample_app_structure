import 'dart:convert';
import 'model/auth_session_info.dart';
import 'model/storage_session_info.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class StorageTokenProcessor {
  void save({AuthSessionInfo sessionInfo, int appType});
  void removeSessionInfo({int appType});
  void removeAllSessionInfos();
  String getCurrentToken({int appType});
  AuthSessionInfo getCurrentSessionInfo({int appType});
}

class DefaultStorageTokenProcessor implements StorageTokenProcessor {
  List<StorageSessionInfo> _sessionInfos = [];
  final String saveAuthSessionKey =
      'SaveAuthService.DefaultStorageTokenProcessor';
  final _storage = FlutterSecureStorage();

  static Future<DefaultStorageTokenProcessor> create() async {
    var storage = DefaultStorageTokenProcessor();
    await storage._loadFromStorage();
    return storage;
  }

  Future<void> _loadFromStorage() async {
    var results = await _storage.read(key: saveAuthSessionKey);
    if (results != null && results.isNotEmpty) {
      List<dynamic> parsedJson = jsonDecode(results);
      _sessionInfos =
          parsedJson.map((e) => StorageSessionInfo.fromJson(e)).toList();
    }
  }

  void _saveToKeychain() {
    var encoded = jsonEncode(_sessionInfos);
    _storage.write(key: saveAuthSessionKey, value: encoded);
  }

  @override
  String getCurrentToken({int appType = 0}) {
    var first = _sessionInfos.firstWhere(
        (element) => element.appType == appType,
        orElse: () => null);
    return first?.sessionInfo?.accessToken ?? '';
  }

  @override
  void removeAllSessionInfos() {
    _sessionInfos.clear();
    _storage.write(key: saveAuthSessionKey, value: '');
  }

  @override
  void removeSessionInfo({int appType}) {
    _sessionInfos.removeWhere((element) => element.appType == appType);
    _saveToKeychain();
  }

  @override
  void save({AuthSessionInfo sessionInfo, int appType = 0}) {
    var existSession = _sessionInfos.firstWhere(
        (element) => element.appType == appType,
        orElse: () => null);
    if (existSession == null) {
      _sessionInfos
          .add(StorageSessionInfo(appType: appType, sessionInfo: sessionInfo));
    } else {
      _sessionInfos.removeWhere((element) => element.appType == appType);
      _sessionInfos
          .add(StorageSessionInfo(appType: appType, sessionInfo: sessionInfo));
    }
    _saveToKeychain();
  }

  @override
  AuthSessionInfo getCurrentSessionInfo({int appType = 0}) {
    var first = _sessionInfos.firstWhere(
        (element) => element.appType == appType,
        orElse: () => null);
    return first?.sessionInfo;
  }
}
