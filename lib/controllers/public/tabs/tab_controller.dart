import 'package:flutter/material.dart';

class CustomTabController {
  final TabController controller;
  final void Function(int index)? onTap;
  final List<Widget> tabs;

  CustomTabController({
    required this.controller,
    required this.tabs,
    this.onTap,
  }) {
    assert(controller.length == tabs.length);
  }
}
