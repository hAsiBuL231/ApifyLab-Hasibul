import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> makePhoneCall(number, type, typeRequest, {BuildContext? ctx}) async {
  var url = Uri.parse("tel:$number");
  if (!await canLaunchUrl(url)) {
    throw Exception('Could not launch $url');
  } else {
    await launchUrl(url);
    //ctx?.read<DashboardCubit>().sendLog(type, typeRequest, number);
  }
}
