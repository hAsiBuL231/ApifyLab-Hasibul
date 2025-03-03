import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget customImage(
    {required String imagePath,
    required String assetPath,
    double? height,
    double? width,
    double? padding,
    double? borderWidth,
    BoxShape? shape,
    Color? color,
    Color? borderColor,
    double? radius,
    BoxFit? fit}) {
  return CachedNetworkImage(
    imageUrl: imagePath,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        borderRadius: shape == BoxShape.circle
            ? null
            : radius == null
                ? null
                : BorderRadius.circular(radius),
        border: Border.all(
            color: borderColor ?? Colors.black, width: borderWidth ?? 1),
        shape: shape ?? BoxShape.circle,
        image: DecorationImage(
          image: imageProvider,
          fit: fit ?? BoxFit.contain,
        ),
      ),
    ),
    placeholder: (context, url) => SizedBox(
        height: height ?? 150,
        width: width ?? 150,
        child: const Center(child: CircularProgressIndicator())),
    errorWidget: (context, url, error) => Container(
        height: height ?? 150,
        width: width ?? 150,
        padding: EdgeInsets.all(padding ?? 0),
        decoration: BoxDecoration(
          color: color,
          shape: shape ?? BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(assetPath), fit: BoxFit.contain),
        )),
  );
}

Widget customAssetImage(
    {required String assetPath,
    double? height,
    double? width,
    double? radius,
    BoxFit? fit}) {
  return Container(
      height: height ?? 150,
      width: width ?? 150,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius ?? 0),
        image: DecorationImage(
            image: AssetImage(assetPath), fit: fit ?? BoxFit.contain),
      ));
}
