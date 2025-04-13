import 'package:flutter/material.dart';

Future<String?> showEditNameDialog(BuildContext context, String currentName) async {
  final controller = TextEditingController(text: currentName);
  return showDialog<String>(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text("تعديل الاسم"),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
          labelText: "الاسم الجديد",
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("إلغاء")),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, controller.text),
          child: const Text("حفظ"),
        ),
      ],
    ),
  );
}
