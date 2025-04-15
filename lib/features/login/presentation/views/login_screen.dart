import 'package:flutter/material.dart';
import '../../../home/presentation/views/home_screen_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;

  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;

      debugPrint("✅ تم تسجيل الدخول بـ: $email - $password");

      // ✅ الانتقال إلى HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  Center(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                        children: [
                          TextSpan(
                            text: ' QB',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.overline,
                              decorationColor: Colors.red,
                              decorationThickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  const Text(
                    'مرحباً بك في المنصة التعليمية 👋',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  const Text('البريد الإلكتروني',
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                  const SizedBox(height: 8),

                  TextFormField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email, color: Colors.white54),
                      hintText: 'أدخل بريدك الإلكتروني',
                      hintStyle: const TextStyle(color: Colors.white38),
                      filled: true,
                      fillColor: Colors.white10,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك أدخل البريد الإلكتروني';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  const Text('كلمة المرور',
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                  const SizedBox(height: 8),

                  TextFormField(
                    controller: passwordController,
                    style: const TextStyle(color: Colors.white),
                    obscureText: obscurePassword,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline, color: Colors.white54),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white54,
                        ),
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),
                      hintText: 'كلمة المرور (حروف وأرقام)',
                      hintStyle: const TextStyle(color: Colors.white38),
                      filled: true,
                      fillColor: Colors.white10,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك أدخل كلمة المرور';
                      }
                      if (value.length < 6) {
                        return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'تسجيل الدخول',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}