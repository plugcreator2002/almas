import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/public/title_span_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TitleSpan extends StatelessWidget {
  final List<TitleSpanConfig> spans;

  const TitleSpan({
    super.key,
    required this.spans,
  });

  @override
  build(context) {
    return Text.rich(
      TextSpan(
        text: "",
        children: spans.map((e) {
          return TextSpan(
            text: e.text,
            recognizer: TapGestureRecognizer()..onTap = e.onTap,
            style: TextStyle(
              fontSize: e.fontSize,
              fontFamily: SystemHandler.family,
              color: e.color ?? SystemHandler.theme.upsideSystem,
            ),
          );
        }).toList(),
      ),
    );
  }
}
