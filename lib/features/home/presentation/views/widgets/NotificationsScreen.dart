import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<Map<String, String>> notifications = [
    {
      'title': '📢 تم إضافة كورس جديد!',
      'body': 'التحق بكورس الإدارة التنفيذية الآن واستفد من المحاضرات الحصرية.',
      'time': 'منذ 5 دقائق'
    },
    {
      'title': '✅ تم تأكيد تسجيلك',
      'body': 'أنت الآن مسجّل بكورس: "English Level 1". بالتوفيق 💪',
      'time': 'اليوم - 10:00 صباحًا'
    },
    {
      'title': '🎯 نصيحة دراسية',
      'body': 'قسم وقتك وحاول تذاكر بتركيز 25 دقيقة وارتاح بعدها، اسمها طريقة Pomodoro 😉',
      'time': 'أمس - 8:45 مساءً'
    },
    {
      'title': '📢 تم إضافة كورس جديد!',
      'body': 'التحق بكورس الإدارة التنفيذية الآن واستفد من المحاضرات الحصرية.',
      'time': 'منذ 5 دقائق'
    },
    {
      'title': '✅ تم تأكيد تسجيلك',
      'body': 'أنت الآن مسجّل بكورس: "English Level 1". بالتوفيق 💪',
      'time': 'اليوم - 10:00 صباحًا'
    },
    {
      'title': '🎯 نصيحة دراسية',
      'body': 'قسم وقتك وحاول تذاكر بتركيز 25 دقيقة وارتاح بعدها، اسمها طريقة Pomodoro 😉',
      'time': 'أمس - 8:45 مساءً'
    },
    {
      'title': '📢 تم إضافة كورس جديد!',
      'body': 'التحق بكورس الإدارة التنفيذية الآن واستفد من المحاضرات الحصرية.',
      'time': 'منذ 5 دقائق'
    },
    {
      'title': '✅ تم تأكيد تسجيلك',
      'body': 'أنت الآن مسجّل بكورس: "English Level 1". بالتوفيق 💪',
      'time': 'اليوم - 10:00 صباحًا'
    },
    {
      'title': '🎯 نصيحة دراسية',
      'body': 'قسم وقتك وحاول تذاكر بتركيز 25 دقيقة وارتاح بعدها، اسمها طريقة Pomodoro 😉',
      'time': 'أمس - 8:45 مساءً'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("الإشعارات", style: TextStyle(color: Colors.black)),
          backgroundColor: const Color(0xFFF9C19A),
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
        ),
        body: notifications.isEmpty
            ? const Center(
          child: Text(
            "مافيش إشعارات دلوقتي 😴",
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
        )
            : ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: notifications.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final item = notifications[index];

            return Dismissible(
              key: Key(item['title']! + index.toString()),
              direction: DismissDirection.endToStart, // ✅ يمين لليسار في RTL
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.redAccent,
                child: const Icon(Icons.delete, color: Colors.white, size: 28),
              ),
              onDismissed: (_) {
                setState(() {
                  notifications.removeAt(index);
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم حذف الإشعار ✅'),
                    backgroundColor: Colors.redAccent,
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepOrange.shade100,
                    child: const Icon(Icons.notifications, color: Colors.deepOrange),
                  ),
                  title: Text(
                    item['title'] ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        item['body'] ?? '',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item['time'] ?? '',
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  isThreeLine: true,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
