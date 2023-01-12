import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/ui_related/buttons/fade_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psr_base/plugin_emulators/forms_builder/widgets/usase_fields/custom_field.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

// ignore: must_be_immutable
class InputCard extends StatefulWidget {
  final void Function(String content) onChanged;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String hintText;
  final String? label;
  final bool obscureText;
  final bool isPassword;
  final TextInputAction textInputAction;
  final String name;
  final String? data;
  final String? Function(String? data)? validator;
  final String? title;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final int? maxLength;
  final EdgeInsetsGeometry? padding;
  final void Function(String)? onFieldSubmitted;
  final Color? errorColor;
  final bool disabledBorder;
  final Color? bgColor;
  final double? height;
  final bool enabled;

  const InputCard({
    Key? key,
    required this.onChanged,
    this.prefixIcon,
    this.hintText = "",
    this.label,
    this.obscureText = false,
    this.isPassword = false,
    this.textInputAction = TextInputAction.done,
    required this.name,
    this.data,
    this.validator,
    this.title,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const [],
    this.maxLength,
    this.padding,
    this.onFieldSubmitted,
    this.errorColor,
    this.disabledBorder = false,
    this.bgColor,
    this.height,
    this.enabled = true,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  SafeState<InputCard> createState() => _InputCardState(isPassword);
}

class _InputCardState extends SafeState<InputCard> {
  final controller = TextEditingController();
  bool obscure = false;

  _InputCardState(this.obscure);

  Widget? _suffix(ThemeData theme) {
    if (widget.suffixIcon != null || widget.isPassword) {
      if (widget.isPassword) {
        final icon = [
          Icons.visibility_outlined,
          Icons.visibility_off_outlined
        ][obscure ? 1 : 0];
        final color = [
          SystemHandler.theme.info,
          SystemHandler.theme.textDisabled,
        ][obscure ? 1 : 0];

        return FadingButton(
          onPressEnd: () => setState(() {
            obscure = !obscure;
          }),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              icon,
              size: 20,
              color: color,
            ),
          ),
        );
      }

      Widget child = Padding(
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
        width: 1,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final node = FocusScope.of(context);

    return SizedBox(
      height: widget.height ?? 66,
      child: CustomField<String>(
        data: widget.data ?? "",
        name: widget.name,
        widgetType: WidgetType.input,
        validator: widget.validator,
        onChanged: (data) => widget.onChanged(data ?? ""),
        decoration: InputDecoration(
          counterText: "",
          hintText: widget.hintText,
          // filled: true,
          errorText: null,
          errorMaxLines: null,
          errorStyle: const TextStyle(height: 0, fontSize: 0),
          suffixIcon: _suffix(theme),
          prefixIcon: _prefix(theme),
          label: _label(theme),
          border: _border(SystemHandler.theme.inherit),
          focusedBorder: _border(SystemHandler.theme.inherit),
          contentPadding: const EdgeInsets.only(top: 5),
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
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                color: widget.bgColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextFormField(
                onFieldSubmitted: (content) {
                  if (widget.textInputAction == TextInputAction.next) {
                    node.requestFocus();
                  }
                  if (widget.onFieldSubmitted != null) {
                    widget.onFieldSubmitted!(content);
                  }
                },
                enabled: widget.enabled,
                initialValue: state.value,
                maxLength: widget.maxLength,
                keyboardType: widget.keyboardType,
                decoration: state.decoration,
                inputFormatters: widget.inputFormatters,
                textInputAction: widget.textInputAction,
                obscureText: obscure,
                onChanged: (data) => state.didChange(data),
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  fontFamily: SystemHandler.family,
                  fontSize: 14,
                  color: SystemHandler.theme.upsideSystem,
                  // theme.colorScheme.upsideSystemColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
