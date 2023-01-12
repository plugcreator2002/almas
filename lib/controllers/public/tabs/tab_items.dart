import 'package:almas/config/languages/extension/tr.dart';
import 'package:flutter/material.dart';

class TabItems {
  static List<Widget> home = [
    Tab(
      text: "my-gem".tr,
    ),
    Tab(
      text: "favorites".tr,
    ),
    Tab(
      text: "most-popular".tr,
    ),
    Tab(
      text: "on-the-stock-market".tr,
    ),
    Tab(
      text: "news".tr,
    ),
  ];

  static List<Widget> topUsers = [
    Tab(
      text: "week".tr,
    ),
    Tab(
      text: "month".tr,
    ),
    Tab(
      text: "year".tr,
    ),
  ];
}
