import 'dart:io';

import 'package:meta/meta.dart';

enum BuildFlavor { production, development, staging }

EnvironmentBuild? get env => _env;
EnvironmentBuild? _env;


/// 不同环境 不同变量
class EnvironmentBuild {
  /// The backend server.
  final String baseUrl;
  final String deviceType;
  final BuildFlavor flavor;

  EnvironmentBuild._init(
      {required BuildFlavor this.flavor,
      required String this.baseUrl,
      required String this.deviceType});

  /// Sets up the top-level [env] getter on the first call only.
  // static void init({@required flavor, @required baseUrl, @required deviceType}) =>
  //     _env ??= BuildEnvironment._init(flavor: flavor, baseUrl: baseUrl, deviceType: deviceType);

  static void init({@required flavor}) {
    var baseUrl;
    var deviceType;
    if (flavor == BuildFlavor.development) {
      baseUrl = 'https://kztest.kzzgz.cn';
    }
    if (flavor == BuildFlavor.production) {
      baseUrl = 'https://www.akuaizhao.com';
    }

    if (Platform.isAndroid) {
      deviceType = 'wxapp_help_android';
    }

    if (Platform.isIOS) {
      deviceType = 'wxapp_help_ios';
    }
    _env ??= EnvironmentBuild._init(
        flavor: flavor, baseUrl: baseUrl, deviceType: deviceType);
  }
}
