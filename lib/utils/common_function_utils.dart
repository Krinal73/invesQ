import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../api/models/http_header_response_model/http_header_response_model.dart';
import '../api/repositories/user_repository/model/response_model/user_response_model/user_response_model.dart';
import 'constants.dart';
import 'get_storage_utils.dart';

class CommonFunctionUtils {
  static String? _deviceType;
  static String? _deviceName;
  static String? _osName;
  static String? _osVersion;
  static PackageInfo? _packageInfo;
  static String? _deviceUniqueId;
  static bool _isPreloaded = false;
  static UserResponseModel? userResponseModel;

  static Future<void> hideKeyboard() async {
    FocusManager.instance.primaryFocus?.unfocus();
    await Future.delayed(const Duration(milliseconds: 300));
  }

  static Future<void> preloadDeviceInfo() async {
    if (_isPreloaded) return;

    try {
      final deviceInfoPlugin = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        final android = await deviceInfoPlugin.androidInfo;
        _deviceType = deviceTypeAndroid;
        _deviceName = android.device;
        _osName = 'ANDROID_${android.product}_${android.model}';
        _osVersion = android.version.release;
      } else {
        final ios = await deviceInfoPlugin.iosInfo;
        _deviceType = deviceTypeIOS;
        _deviceName = ios.name;
        _osName = ios.systemName;
        _osVersion = ios.systemVersion;
      }

      _packageInfo = await PackageInfo.fromPlatform();
      _deviceUniqueId = await FlutterUdid.consistentUdid;

      final userJson = await GetStorageUtils.getString(kUserResponseModel, '');
      if (userJson.isNotEmpty) {
        userResponseModel = UserResponseModel.fromJson(jsonDecode(userJson));
      }

      _isPreloaded = true;
    } catch (e) {
      print("preloadDeviceInfo failed: $e");
    }
  }

  static Future<HTTPHeaderResponseModel> getHeaders() async {
    final token = await GetStorageUtils.getString(kAuthorizationToken, '');
    await preloadDeviceInfo();

    return HTTPHeaderResponseModel(
      authorizationToken: token.isNotEmpty ? 'Bearer $token' : null,
      deviceType: _deviceType,
      deviceName: _deviceName,
      osName: _osName,
      osVersion: _osVersion,
      versionName: _packageInfo?.version,
      versionCode: _packageInfo?.buildNumber,
      uniqueId: _deviceUniqueId,
    );
  }
}
