/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: zhaojijin
 * @Date: 2019-04-18 15:21:47
 * @LastEditTime: 2019-04-25 11:54:24
 */
import 'package:flutter/material.dart';
import 'package:flutter_kline/packages/bloc/klineBloc.dart';
import 'package:flutter_kline/packages/bloc/klineBlocProvider.dart';
import 'package:flutter_kline/packages/model/klineConstrants.dart';
import 'package:flutter_kline/packages/model/klineModel.dart';

class KlineVolumeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    KlineBloc bloc = KlineBlocProvider.of<KlineBloc>(context);
    return StreamBuilder(
      stream: bloc.currentKlineListStream,
      builder: (BuildContext context, AsyncSnapshot<List<Market>> snapshot) {
        return CustomPaint(
          key: bloc.volumeWidgetKey,
          size: Size(bloc.screenWidth, bloc.screenWidth / kVolumeAspectRatio),
          painter: _KlineVolumePainter(
              snapshot.data, bloc.volumeMax, bloc.candlestickWidth),
        );
      },
    );
  }
}

class _KlineVolumePainter extends CustomPainter {
  final List<Market>? listData;
  final double? maxVolume;
  _KlineVolumePainter(
    this.listData,
    this.maxVolume,
    this.columnarWidth,
  );

  /// 柱状体宽度
  final double? columnarWidth;

  /// 柱状体之间间隙 = 烛台间空隙
  final double? columnarGap = kColumnarGap;
  final double? columnarTopMargin = kColumnarTopMargin;
  final Color? increaseColor = kIncreaseColor;
  final Color? decreaseColor = kDecreaseColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (listData == null || maxVolume == null || maxVolume == 0) {
      return;
    }
    double height = size.height - (columnarTopMargin ?? 0);
    final double heightVolumeOffset = height / (maxVolume ?? 0);
    double columnarRectLeft;
    double columnarRectTop;
    double columnarRectRight;
    double columnarRectBottom;

    Paint columnarPaint;

    for (int i = 0; i < (listData ?? []).length; i++) {
      Market? market = listData?[i];
      // 画笔
      Color painterColor;
      if ((market?.open ?? 0) > (market?.close ?? 0)) {
        painterColor = decreaseColor ?? Colors.white;
      } else if ((market?.open ?? 0) == (market?.close ?? 0)) {
        painterColor = Colors.white;
      } else {
        painterColor = increaseColor ?? Colors.white;
      }
      columnarPaint = Paint()
        ..color = painterColor
        ..strokeWidth = columnarWidth ?? 0
        ..isAntiAlias = true
        ..filterQuality = FilterQuality.high;

      // 柱状体
      int j = (listData?.length ?? 0) - 1 - i;
      columnarRectLeft = j * ((columnarWidth ?? 0) + (columnarGap ?? 0)) + (columnarGap ?? 0);
      columnarRectRight = columnarRectLeft + (columnarWidth ?? 0);
      columnarRectTop =
          height - (market?.vol ?? 0) * heightVolumeOffset + (columnarTopMargin ?? 0);
      columnarRectBottom = height + (columnarTopMargin ?? 0);
      // print('columnarRectTop : $columnarRectTop   columnarRectBottom: $columnarRectBottom');
      Rect columnarRect = Rect.fromLTRB(columnarRectLeft, columnarRectTop,
          columnarRectRight, columnarRectBottom);
      canvas.drawRect(columnarRect, columnarPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return listData != null;
  }
}
