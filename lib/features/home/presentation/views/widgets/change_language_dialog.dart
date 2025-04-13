import 'package:flutter/material.dart';

void showChangeLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text("تغيير اللغة"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("العربية"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("English"),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    ),
  );
}
