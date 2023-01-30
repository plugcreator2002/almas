import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psr_base/plugin_emulators/forms_builder/widgets/usase_fields/custom_field.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

// ignore: must_be_immutable
class InputArea extends StatefulWidget {
  final void Function(String content) onChanged;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String hintText;
  final String? label;
  final TextInputAction textInputAction;
  final String name;
  final String? data;
  final String? Function(String? data)? validator;
  final String? title;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final int? maxLength;
  final int maxLines;
  final int minLines;
  final double? minHeight;
  final EdgeInsetsGeometry? padding;
  final void Function(String)? onFieldSubmitted;
  final Color? errorColor;
  final bool disabledBorder;
  final Color? bgColor;
  final double? height;
  final bool enabled;

  const InputArea({
    Key? key,
    required this.onChanged,
    this.prefixIcon,
    this.hintText = "",
    this.label,
    this.textInputAction = TextInputAction.newline,
    required this.name,
    this.data,
    this.validator,
    this.title,
    this.suffixIcon,
    this.keyboardType = TextInputType.multiline,
    this.inputFormatters = const [],
    this.maxLength,
    this.padding,
    this.onFieldSubmitted,
    this.errorColor,
    this.disabledBorder = false,
    this.bgColor,
    this.height,
    this.enabled = true,
    this.maxLines = 5,
    this.minHeight,
    this.minLines = 1,
  }) : super(key: key);

  @override
  SafeState<InputArea> createState() => _InputAreaState();
}

class _InputAreaState extends SafeState<InputArea> {
  final controller = TextEditingController();
  final _direction = ValueNotifier(
    TextDirection.ltr,
  );

  Widget? _suffix(ThemeData theme) {
    if (widget.suffixIcon != null) {
      final child = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Icon(
          widget.suffixIcon,
          size: 20,
          color: SystemHandler.theme.textDisabled,
        ),
      );
      return child;
    }
    return null;
  }

  Widget? _prefix(ThemeData theme) {
    if (widget.prefixIcon != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Icon(
          widget.prefixIcon,
          size: 20,
          color: SystemHandler.theme.textDisabled,
        ),
      );
    }
    return null;
  }

  Widget? _label(ThemeData theme) {
    if (widget.label != null) {
      return Text(
        widget.label ?? "",
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontFamily: SystemHandler.family,
          color: SystemHandler.theme.upsideSystem,
          fontSize: 20,
        ),
      );
    }
    return null;
  }

  InputBorder? _border(Color color) {
    if (widget.disabledBorder) return InputBorder.none;
    return UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final node = FocusScope.of(context);

    return CustomField<String>(
      data: widget.data ?? "",
      name: widget.name,
      widgetType: WidgetType.input,
      validator: widget.validator,
      onChanged: (data) => widget.onChanged(data ?? ""),
      decoration: InputDecoration(
        counterText: "",
        hintText: widget.hintText,
        errorText: null,
        errorMaxLines: null,
        errorStyle: const TextStyle(height: 0, fontSize: 0),
        suffix: _suffix(theme),
        prefix: _prefix(theme),
        label: _label(theme),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        hintStyle: TextStyle(
          fontFamily: SystemHandler.family,
          fontSize: 15,
          color: SystemHandler.theme.textDisabled,
        ),
        focusedErrorBorder: _border(
          widget.errorColor ?? SystemHandler.theme.error,
        ),
        errorBorder: _border(
          widget.errorColor ?? SystemHandler.theme.error,
        ),
      ),
      child: (state) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: widget.minHeight ?? 66,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                color: widget.bgColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: ValueListenableBuilder<TextDirection>(
                  valueListenable: _direction,
                  builder: (context, value, child) {
                    return TextFormField(
                      onFieldSubmitted: (content) {
                        if (widget.textInputAction == TextInputAction.next) {
                          node.requestFocus();
                        }
                        if (widget.onFieldSubmitted != null) {
                          widget.onFieldSubmitted!(content);
                        }
                      },
                      minLines: widget.minLines,
                      initialValue: state.value,
                      maxLines: widget.maxLines,
                      keyboardType: widget.keyboardType,
                      textInputAction: widget.textInputAction,
                      maxLength: widget.maxLength,
                      decoration: state.decoration,
                      inputFormatters: widget.inputFormatters,
                      textDirection: value,
                      onChanged: (data) {
                        state.didChange(data);
                        if (data.trim().length < 2) {
                          final direction = data.getDirection;
                          if (direction != value) _direction.value = direction;
                        }
                      },
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(
                        fontFamily: SystemHandler.family,
                        fontSize: 15,
                        color: SystemHandler.theme.upsideSystem,
                      ),
                    );
                  }),
            ),
          ),
        );
      },
    );
  }
}
