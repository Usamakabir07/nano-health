import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nano_health/common/colors.dart';

import 'navigation_service.dart';

void showToast({
  ToastGravity gravity = ToastGravity.BOTTOM,
  required String message,
  required BuildContext context,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: gravity,
    timeInSecForIosWeb: 1,
    backgroundColor: MyColors.grey,
    textColor: MyColors.black,
    fontSize: 15.00,
  );
}

final double kWidth =
    MediaQuery.of(NavigationService.navigatorKey.currentContext!).size.width;
final double kHeight =
    MediaQuery.of(NavigationService.navigatorKey.currentContext!).size.height;

void handleDioError(DioException e) {
  e.response == null
      ? showToast(
          message: 'Please check your internet connection, and try again!',
          context: NavigationService.navigatorKey.currentContext!)
      : e.response!.statusCode == 500
          ? showToast(
              message: 'Server is not responding',
              context: NavigationService.navigatorKey.currentContext!)
          : e.response != null &&
                  e.response?.data != null &&
                  e.response?.data != '' &&
                  e.response!.statusCode != 400 &&
                  e.response!.statusCode != 401
              ? showToast(
                  message: e.response?.data,
                  context: NavigationService.navigatorKey.currentContext!)
              : showToast(
                  message: e.response!.statusMessage.toString(),
                  context: NavigationService.navigatorKey.currentContext!);
}
