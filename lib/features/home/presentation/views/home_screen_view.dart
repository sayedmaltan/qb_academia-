import 'package:flutter/material.dart';
import 'package:qb_academia/features/home/presentation/views/widgets/delivery_page.dart';
import 'package:qb_academia/features/home/presentation/views/widgets/exam_schedule_page.dart';
import 'package:qb_academia/features/home/presentation/views/widgets/home_page.dart';
import 'package:qb_academia/features/home/presentation/views/widgets/home_screen_view_body.dart';
import 'package:qb_academia/features/home/presentation/views/widgets/profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _pulseController;

  final List<Widget> _pages = [
    const HomePage(),
    const ExamSchedulePage(),
    const HomeScreen(),
    const DeliveryPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isCoursesSelected = _selectedIndex == 2;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: _pages[_selectedIndex],
      extendBody: true,
      bottomNavigationBar: SizedBox(
        height: 105,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xFF121212),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(icon: Icons.home, label: 'الرئيسية', index: 0),
                  _buildNavItem(icon: Icons.schedule, label: 'الاختبارات', index: 1),
                  const SizedBox(width: 60),
                  _buildNavItem(icon: Icons.local_shipping, label: 'التوصيل', index: 3),
                  _buildNavItem(icon: Icons.person, label: 'حسابي', index: 4),
                ],
              ),
            ),

            // الدائرة المتوهجة
            Positioned(
              bottom: 32,
              child: GestureDetector(
                onTap: () => _onItemTapped(2),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (isCoursesSelected)
                      ScaleTransition(
                        scale: Tween(begin: 1.0, end: 1.12).animate(
                          CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
                        ),
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isCoursesSelected ? Colors.yellow : Colors.grey[800],
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: [
                          if (isCoursesSelected)
                            BoxShadow(
                              color: Colors.yellow ,
                              blurRadius: 25,
                              spreadRadius: 1,
                              offset: const Offset(0, 6),
                            )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/image/book.png',
                          color: isCoursesSelected ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // عنوان الكورسات
            Positioned(
              bottom: 10,
              child: Column(
                children: [
                  Text(
                    'الكورسات',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: isCoursesSelected ? Colors.yellow : Colors.white54,
                    ),
                  ),
                  if (isCoursesSelected)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      width: 45,
                      height: 2,
                      color: Colors.white,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Colors.yellow : Colors.white54),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.yellow : Colors.white54,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
