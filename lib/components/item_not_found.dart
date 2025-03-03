import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'typography.dart';

Widget itemNotFound(String message) {
  return Card(
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: CustomText(
          text: message,
          fontSize: 15.sp,
          color: Colors.grey[600],
        ),
      ),
    ),
  );
}
