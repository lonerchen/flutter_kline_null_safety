/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: zhaojijin
 * @Date: 2019-04-18 16:48:38
 * @LastEditTime: 2019-04-25 11:47:15
 */
import 'package:flutter/material.dart';
import 'package:flutter_kline_null_safety/packages/bloc/klineBloc.dart';
import 'package:flutter_kline_null_safety/packages/bloc/klineBlocProvider.dart';
import 'package:flutter_kline_null_safety/packages/model/klineConstrants.dart';
import 'package:flutter_kline_null_safety/packages/model/klineModel.dart';

class KlineMaLineWidget extends StatelessWidget {
  final YKMAType maType;
  KlineMaLineWidget(this.maType);
  @override
  Widget build(BuildContext context) {
    KlineBloc bloc = KlineBlocProvider.of<KlineBloc>(context);
    return StreamBuilder(
      stream: bloc.currentKlineListStream,
      builder: (BuildContext context, AsyncSnapshot<List<Market>> snapshot) {
        List<Market>? listData;
        if (snapshot.data != null) {
          listData = snapshot.data;
        }
        return CustomPaint(
          size: Size(bloc.screenWidth, bloc.screenWidth / kcandleAspectRatio),
          painter: _KlineMaLinePainter(listData, maType, bloc.priceMax,
              bloc.priceMin, bloc.candlestickWidth),
        );
      },
    );
  }
}

class _KlineMaLinePainter extends CustomPainter {
  _KlineMaLinePainter(this.listData, this.maType, this.priceMax, this.priceMin,
      this.candlestickWidth);
  final List<Market>? listData;
  final YKMAType? maType;
  final double? priceMax;
  final double? priceMin;
  final double? candlestickWidth;
  final double? lineWidth = kMaLineWidth;
  final double? topMargin = kMaTopMargin;
  final double? candlestickGap = kCandlestickGap;
  Color? lineColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (listData == null ||
        priceMax == null ||
        priceMin == null ||
        maType == null) {
      return;
    }

    double height = size.height - (topMargin ?? 0);
    double heightPriceOffset = 0;
    if ((priceMax ?? 0) - (priceMin ?? 0) != 0) {
      heightPriceOffset = height / ((priceMax ?? 0) - (priceMin ?? 0));
    }

    for (int i = 0; i < (listData?.length ?? 0); i++) {
      if (i == (listData?.length ?? 0) - 1) {
        break;
      }

      Market? market = listData?[i];
      Market? nextMarket = listData?[i + 1];
      // print(
      // '============ market.priceMa1 : ${market.priceMa1}  market.priceMa2 : ${market.priceMa2}  market.priceMa3 : ${market.priceMa3} index: $i count : ${listData.length}');
      if ((market?.priceMa1 == null && maType == YKMAType.MA5) ||
          (market?.priceMa2 == null && maType == YKMAType.MA10) ||
          (market?.priceMa3 == null && maType == YKMAType.MA30)) {
        // print(
        // 'continue========= ${market.priceMa1}==${market.priceMa2}==${market.priceMa3}');
        break;
      }
      double? currentMaPrice;
      double? currentNextMaPrice;

      switch (maType) {
        case YKMAType.MA5:
          {
            lineColor = kMa5LineColor;
            currentMaPrice = market?.priceMa1 ?? 0;
            currentNextMaPrice = nextMarket?.priceMa1 ?? 0;
          }
          break;
        case YKMAType.MA10:
          {
            lineColor = kMa10LineColor;
            currentMaPrice = market?.priceMa2 ?? 0;
            currentNextMaPrice = nextMarket?.priceMa2 ?? 0;
          }
          break;
        case YKMAType.MA30:
          {
            lineColor = kMa20LineColor;
            currentMaPrice = market?.priceMa3 ?? 0;
            currentNextMaPrice = nextMarket?.priceMa3 ?? 0;
          }
          break;
        default:
      }

      Paint maPainter = Paint()
        ..color = lineColor!
        ..isAntiAlias = true
        ..filterQuality = FilterQuality.high
        // ..strokeCap = StrokeCap.round
        ..strokeWidth = (lineWidth ?? 0);

      double startX, startY, endX, endY;
      int j = (listData?.length ?? 0) - 1 - i;

      double startRectLeft =
          j * ((candlestickWidth ?? 0) + (candlestickGap ?? 0)) + (candlestickGap ?? 0);
      double endRectLeft =
          (j - 1) * ((candlestickWidth ?? 0) + (candlestickGap ?? 0)) + (candlestickGap ?? 0);
      startX = startRectLeft + (candlestickWidth ?? 0) / 2;
      endX = endRectLeft + (candlestickWidth ?? 0) / 2;

      // print('startX: $startX ==== endX: $endX     === ${i}');
      if (currentMaPrice != null && currentNextMaPrice != null) {
        startY = height -
            (currentMaPrice - (priceMin ?? 0)) * heightPriceOffset +
            (topMargin ?? 0);
        endY = height -
            (currentNextMaPrice - (priceMin ?? 0)) * heightPriceOffset +
            (topMargin ?? 0);

        canvas.drawLine(Offset(startX, startY), Offset(endX, endY), maPainter);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return listData != null;
  }
}
