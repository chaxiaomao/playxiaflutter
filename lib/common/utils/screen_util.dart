
import 'package:flutter_screenutil/flutter_screenutil.dart';

double setCustomHeight(double h) {
  return ScreenUtil().setHeight(h);
}

///setCustomWidth(37w)
///or instead of 375.w
///如果不需要像素转换 可直接返回
double setCustomWidth(double w) {
  return ScreenUtil().setWidth(w);
}

double setCustomFontSize(double s) {
  return ScreenUtil().setSp(s);
}