// ignore_for_file: depend_on_referenced_packages
import 'package:almas/controllers/public/system_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BaseWidgets extends StatefulWidget {
  final Widget? desktop;
  final Widget? mobile;
  final Widget? tablet;

  const BaseWidgets({
    Key? key,
    this.desktop,
    this.mobile,
    this.tablet,
  }) : super(key: key);

  @override
  SafeState<BaseWidgets> createState() => _BaseWidgetsState();
}

class _BaseWidgetsState extends SafeState<BaseWidgets> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
  }

  Widget get _noPermission {
    return Scaffold(
      body: Center(
        child: Text(
          "The program is not supported on such a resolution",
          style: TextStyle(
            fontFamily: SystemHandler.family,
            fontSize: 20,
            color: SystemHandler.theme.upsideSystem,
          ),
        ),
      ),
    );
  }

  Widget body(Widget? child) {
    return child ?? _noPermission;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenTypeLayout(
        desktop: body(widget.mobile),
        mobile: body(widget.mobile),
        tablet: body(widget.mobile),
        watch: body(widget.mobile),
      ),
    );
  }
}
