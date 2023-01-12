import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/models/public/radio_choice.dart';
import 'package:flutter/material.dart';
import 'package:psr_base/ui_related/builders/safe_state.dart';

class RadioChoiceMobile extends StatefulWidget {
  final RadioChoiceModel model;
  final void Function(RadioChoiceModel model) callback;
  final String choice;

  const RadioChoiceMobile({
    Key? key,
    required this.model,
    required this.callback,
    required this.choice,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  SafeState<RadioChoiceMobile> createState() => _RadioChoiceMobile(model);
}

class _RadioChoiceMobile extends SafeState<RadioChoiceMobile> {
  late RadioChoiceModel model;

  _RadioChoiceMobile(this.model);

  Widget get _icon {
    if (widget.choice == model.id) {
      return const Icon(
        Icons.radio_button_checked_rounded,
        size: 20,
      );
    }
    return const Icon(
      Icons.radio_button_off_rounded,
      size: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => widget.callback(model),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _icon,
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              model.label,
              maxLines: 3,
              style: TextStyle(
                fontFamily: SystemHandler.family,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
