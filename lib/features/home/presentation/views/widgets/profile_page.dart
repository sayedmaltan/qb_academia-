import 'package:flutter/material.dart';
import 'package:qb_academia/features/home/presentation/views/widgets/profile_image_picker.dart';

import 'change_language_dialog.dart';
import 'edit_name_dialog.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "Ahmed ElSisi";
  String userEmail = "student@example.com";
  ImageProvider userImage = const AssetImage('assets/images/default_avatar.png');

  void _editName() async {
    final updatedName = await showEditNameDialog(context, userName);
    if (updatedName != null) {
      setState(() => userName = updatedName);
    }
  }

  void _changeLanguage() {
    showChangeLanguageDialog(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text("الملف الشخصي", style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xFFF9C19A),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            // صورة البروفايل
            ProfileImagePicker(
              image: userImage,
              onImageSelected: (newImage) {
                setState(() {
                  userImage = newImage;
                });
              },
            ),
            SizedBox(height: 12),

            // الاسم والبريد
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(userName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: _editName,
                          child: const Icon(Icons.edit, size: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(userEmail, style: const TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
            ),

            // تغيير اللغة
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.language, color: Colors.deepPurple),
                title: const Text("تغيير اللغة"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: _changeLanguage,
              ),
            ),

            const SizedBox(height: 16),

            // تطوير الصفحة
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.info_outline, color: Colors.orange),
                title: const Text("جاري تطوير الصفحة..."),
                subtitle: const Text("المزيد من المميزات قريبًا 🔧"),
              ),
            ),

            const SizedBox(height: 40),

            // زر تسجيل الخروج
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF9C19A),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                icon: const Icon(Icons.logout),
                label: const Text("تسجيل الخروج"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
