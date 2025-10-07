import 'package:flutter/material.dart' as m;
import 'package:royalxui/uikit.dart' as u;

class ListTile extends m.StatelessWidget {
  final double? width;
  final m.IconData icon;
  final String title;
  final String subtitle;
  final m.Widget? trailing;
  final Function()? onTap;
  const ListTile({
    super.key,
    this.width,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  m.Widget build(m.BuildContext context) {
    return m.SizedBox(
      width: width ?? double.infinity,
      child: m.InkWell(
        onTap: onTap,
        child: m.ListTile(
          leading: m.Icon(icon),
          title: u.Text(title),
          subtitle: u.Text(subtitle),
          trailing: trailing,
        ),
      ),
    );
  }
}
