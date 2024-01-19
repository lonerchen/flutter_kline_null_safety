library flutter_kline;

export 'package:flutter_kline/packages/bloc/klineBloc.dart';
export 'package:flutter_kline/packages/bloc/klineBlocProvider.dart';
export 'package:flutter_kline/packages/manager/klineDataManager.dart';
export 'package:flutter_kline/packages/model/klineConstrants.dart';
export 'package:flutter_kline/packages/model/klineModel.dart';
export 'package:flutter_kline/packages/model/kline_data_model.dart';
export 'package:flutter_kline/packages/view/klineWidget.dart';
export 'package:flutter_kline/packages/klinePage.dart';

import 'flutter_kline_platform_interface.dart';

class FlutterKline {
  Future<String?> getPlatformVersion() {
    return FlutterKlinePlatform.instance.getPlatformVersion();
  }
}
