import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/courses/presentation/manger/course_cubit/course_cubit..dart';
import 'features/courses/presentation/manger/course_cubit/post_cubit.dart';
import 'features/splash/presentation/views/splash_screen.dart';
import 'core/utils/api_post.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CourseCubit>(
          create: (_) => CourseCubit()..fetchCourses(),
        ),
        BlocProvider<PostCubit>(
          create: (_) => PostCubit(ApiPostService())..fetchPosts(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QB Cert',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF2F2F2),
          primaryColor: const Color(0xFFF9C19A),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFF9C19A),
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            elevation: 0,
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.black87),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
