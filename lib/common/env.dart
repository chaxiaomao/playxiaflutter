import 'dart:io';

import 'package:meta/meta.dart';

enum BuildFlavor { production, development, staging }

EnvironmentBuild? get env => _env;
EnvironmentBuild? _env;

/// 区分测试服，正式服
class EnvironmentBuild {
  final String baseUrl;
  final String deviceType;
  final BuildFlavor flavor;

  static const DEV_HOSTS = 'https://kztest.kzzgz.cn';
  static const PROD_HOSTS = 'https://www.akuaizhao.com';
  static const DEVICE_ANDROID = 'wxapp_help_android';
  static const DEVICE_IOS = 'wxapp_help_ios';

  EnvironmentBuild._init({required this.flavor, required this.baseUrl, required this.deviceType});

  /// Sets up the top-level [env] getter on the first call only.
  // static void init({@required flavor, @required baseUrl, @required deviceType}) =>
  //     _env ??= BuildEnvironment._init(flavor: flavor, baseUrl: baseUrl, deviceType: deviceType);

  static void init({@required flavor}) {
    var baseUrl;
    var deviceType;
    if (flavor == BuildFlavor.development) {
      baseUrl = DEV_HOSTS;
    }
    if (flavor == BuildFlavor.production) {
      baseUrl = PROD_HOSTS;
    }

    if (Platform.isAndroid) {
      deviceType = DEVICE_ANDROID;
    }

    if (Platform.isIOS) {
      deviceType = DEVICE_IOS;
    }
    _env ??= EnvironmentBuild._init(flavor: flavor, baseUrl: baseUrl, deviceType: deviceType);
  }
}
