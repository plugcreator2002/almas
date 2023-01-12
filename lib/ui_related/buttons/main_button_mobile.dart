import 'package:almas/config/styles/styles.dart';
import 'package:almas/controllers/public/loading_controller.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/providers/public/loading_presenter.dart';
import 'package:almas/ui_related/buttons/fade_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainButtonMobile extends StatelessWidget {
  final String? label;
  final Color? bgColor;
  final Color? borderColor;
  final Color? labelColor;
  final void Function()? onTap;
  final num? height;
  final num? width;
  final IconData? icon;
  final double? iconSize;
  final double? headSize;
  final BorderRadiusGeometry? borderRadius;
  final String? loadingKey;
  final bool? Function()? validate;
  final MainAxisSize mainAxisSize;
  final int flex;
  final bool hasShadow;

  const MainButtonMobile({
    Key? key,
    this.label,
    this.bgColor,
    this.borderColor,
    this.labelColor,
    this.onTap,
    this.height,
    this.icon,
    this.iconSize,
    this.headSize,
    this.width,
    this.borderRadius,
    this.loadingKey,
    this.validate,
    this.mainAxisSize = MainAxisSize.max,
    this.flex = 0,
    this.hasShadow = true,
  }) : super(key: key);

  Widget? _loading(bool isLoading) {
    if (isLoading) {
      return SizedBox(
        width: 11,
        height: 11,
        child: CircularProgressIndicator(
          color: _labelColor(isLoading),
          strokeWidth: 2,
        ),
      );
    }
    return null;
  }

  Widget? _icon(bool? isLoading) {
    Widget? child = _loading(isLoading ?? false);
    if (icon != null) {
      child ??= Icon(
        icon,
        size: iconSize ?? 15,
        color: _labelColor(isLoading),
      );
    }
    if (child != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: child,
      );
    }
    return null;
  }

  Color _bgColor(bool? isLoading) {
    if (isLoading == true && borderColor == null) {
      return SystemHandler.theme.disabled;
    }
    return bgColor ?? SystemHandler.theme.primary;
  }

  Color _borderColor(bool? isLoading) {
    if (isLoading == true) {
      return SystemHandler.theme.disabled;
    }
    return borderColor ?? bgColor ?? Colors.transparent;
  }

  Color? _labelColor(bool? isLoading) {
    if (isLoading == true) {
      return SystemHandler.theme.upsideSystem;
    }
    return labelColor ?? borderColor ?? SystemHandler.theme.system;
  }

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoadingPresenter>(context);

    return FutureBuilder<bool>(
      future: Future.value(presenter.data[loadingKey] ?? false),
      builder: (context, snapshot) {
        final child = FadingButton(
          onPressEnd: () {
            final isLoading = LoadingController.instance.isLoading(
              loadingKey,
            );

            if (isLoading == false) {
              final validate = (this.validate ?? () => true)();

              if (validate == true && onTap != null && snapshot.data != true) {
                (onTap ?? () {})();
              }
            }
          },
          child: Container(
            height: (height ?? 44).toDouble(),
            width: width?.toDouble(),
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: _bgColor(snapshot.data),
              borderRadius: borderRadius ?? BorderRadius.circular(4),
              boxShadow: hasShadow ? StylesConfig.instance.mainShadow : null,
              border: Border.all(
                width: 1,
                color: _borderColor(snapshot.data),
              ),
            ),
            child: Row(
              mainAxisSize: mainAxisSize,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _icon(snapshot.data),
                Text(
                  label ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: SystemHandler.family,
                    fontSize: headSize ?? 18,
                    color: _labelColor(snapshot.data),
                  ),
                ),
              ].whereType<Widget>().toList(),
            ),
          ),
        );

        if (flex != 0) {
          return Expanded(
            flex: flex,
            child: child,
          );
        }
        return child;
      },
    );
  }
}
