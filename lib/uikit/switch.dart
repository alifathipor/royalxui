import 'package:flutter/material.dart' as m;

class Switch extends m.StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;
  const Switch({super.key, required this.value, required this.onChanged});

  @override
  m.Widget build(m.BuildContext context) {
    return m.Switch(value: value, onChanged: onChanged);
  }
}
