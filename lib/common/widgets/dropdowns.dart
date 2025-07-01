import 'package:flutter/material.dart';
import 'package:smartcampus/constants/colors.dart';

class Dropdowns {
  Widget simpleDropdown<T>({
    required String hintText,
    required List<T> items,
    required T initialItem,
    required ValueChanged<T?> onChanged,
  }) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        labelText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: skyBlue, width: 2),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      value: initialItem,
      items: items.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem<T>(value: value, child: Text(value.toString()));
      }).toList(),
      onChanged: (T? value) {
        onChanged(value);
      },
    );
  }
}
