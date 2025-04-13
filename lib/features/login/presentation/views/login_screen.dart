import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../home/presentation/views/widgets/home_screen_view_body.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  void loginUser() async {
    setState(() {
      isLoading = true;
    });

    // هنا يمكن تنفيذ عملية التحقق من البريد وكلمة المرور عبر API
    // بعد النجاح نقوم بتخزين حالة تسجيل الدخول في SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_logged_in', true); // تخزين حالة تسجيل الدخول

    // العودة إلى الصفحة الرئيسية بعد التسجيل
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل الدخول')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'البريد الإلكتروني'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'كلمة المرور'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: loginUser,
              child: const Text('تسجيل الدخول'),
            ),
          ],
        ),
      ),
    );
  }
}
