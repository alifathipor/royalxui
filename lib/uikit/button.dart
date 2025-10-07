import 'package:flutter/material.dart' as m;
import 'package:royalxui/toolkit.dart' as t;

class Button extends m.StatelessWidget {
  final void Function() onPressed;
  final t.EnumActionsButtons? actions;

  final m.Widget child;
  const Button({
    super.key,
    required this.onPressed,
    required this.child,
    this.actions,
  });

  @override
  m.Widget build(m.BuildContext context) {
    switch (actions) {
      case t.EnumActionsButtons.textButton:
        return m.TextButton(onPressed: onPressed, child: child);
      case t.EnumActionsButtons.filledButton:
        return m.FilledButton(
          onPressed: onPressed,
          style: m.ButtonStyle(
            fixedSize: m.WidgetStateProperty.all(m.Size.fromHeight(50)),
            shape: m.WidgetStatePropertyAll(
              m.RoundedRectangleBorder(
                borderRadius: m.BorderRadius.circular(20), 
              ),
            ),
          ),
          child: child,
        );
      default:
        return m.ElevatedButton(onPressed: onPressed, child: child);
    }
  }
}
