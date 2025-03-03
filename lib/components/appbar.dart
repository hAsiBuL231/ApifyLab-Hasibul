import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'typography.dart';

PreferredSizeWidget customAppBar(
    {String? title,
    Color? bgColor,
    Color? fontColor,
    Color? iconColor,
    IconButton? leadingIcon,
    List<Widget>? actions,
    bool centerTitle = false,
    double? fontSize,
    double? iconSize,
    FontWeight fontWeight = FontWeight.normal,
    PreferredSize? tabBar}) {
  return AppBar(
    backgroundColor: bgColor ?? Colors.white,
    shadowColor: bgColor ?? Colors.white,
    surfaceTintColor: bgColor ?? Colors.white,
    leading: leadingIcon,
    elevation: 0,
    iconTheme: IconThemeData(
        color: iconColor ?? Colors.black, size: iconSize ?? .05.sw),
    title: CustomText(
        text: title ?? "",
        fontSize: fontSize ?? 0.05.sw,
        fontWeight: fontWeight,
        color: fontColor),
    centerTitle: centerTitle,
    actions: actions,
    bottom: tabBar,
  );
}
