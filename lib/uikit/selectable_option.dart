import 'package:flutter/material.dart';

class SelectableOption extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const SelectableOption({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 70,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected
                ? theme.colorScheme.primary
                : theme.colorScheme.outlineVariant,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// متن سمت راست
            Text(
              text,
              style: theme.textTheme.bodyLarge,
            ),

            /// RadioButton سمت چپ
            Radio<bool>(
              value: true,
              groupValue: selected,
              onChanged: (_) => onTap(),
              activeColor: theme.colorScheme.primary,
              fillColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return theme.colorScheme.primary;
                }
                return theme.colorScheme.outline; // رنگ نازک برای حالت غیر انتخاب‌شده
              }),
            ),
          ],
        ),
      ),
    );
  }
}
