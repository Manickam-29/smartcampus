import 'package:flutter/material.dart';

class CheckboxGroup extends StatelessWidget {
  final List<String> options;
  final String? selected;
  final Function(String?) onChanged;

  const CheckboxGroup({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16.0,
      runSpacing: 8.0,
      children: options.map((option) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: selected == option,
              onChanged: (_) => onChanged(option),
            ),
            Text(option),
          ],
        );
      }).toList(),
    );
  }
}
