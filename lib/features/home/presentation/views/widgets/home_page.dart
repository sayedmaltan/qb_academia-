import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'PostDetailScreen.dart';
import '../../manger/post_cubit/post_cubit.dart';
import '../../manger/post_cubit/post_state.dart';
import 'NotificationsScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      PostCubit.get(context).getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9C19A),
        elevation: 0,
        centerTitle: true,
        leading: Stack(
          children: [
            IconButton(
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 34,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationsScreen(),
                  ),
                );
              },
            ),
            Positioned(
              left: 6,
              top: 6,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                child: const Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.school, color: Colors.black87, size: 24),
            SizedBox(width: 8),
            Text(
              'أكاديمية QB',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              await PostCubit.get(context).getPosts();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "استكشف الكورسات",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "ابدأ رحلتك التعليمية من هنا ✨",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// ✅ سلايدر من الـ Posts API
                  if (state is PostLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (state is PostSuccess)
                    SizedBox(
                      height: 200,
                      child: PageView.builder(
                        itemCount: state.posts.take(5).length,
                        controller: PageController(viewportFraction: 0.9),
                        itemBuilder: (_, index) {
                          final post = state.posts[index];
                          return GestureDetector(
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (_) => PostDetailScreen(post: post),
                                  ),
                                ),
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                                image: DecorationImage(
                                  image:
                                      post.featuredImage != null
                                          ? NetworkImage(
                                            post.featuredImage!,
                                          )
                                          : AssetImage(
                                            'assets/images/image-error.png',
                                          ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: const LinearGradient(
                                    colors: [Colors.black, Colors.transparent],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: const EdgeInsets.all(16),
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  post.title.rendered,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 5,
                                        color: Colors.black26,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  else
                    const Center(child: Text("فشل تحميل السلايدر 😢")),

                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 24, 16, 10),
                    child: Row(
                      children: [
                        Icon(Icons.new_releases, color: Colors.deepOrange),
                        SizedBox(width: 8),
                        Text(
                          "أحدث الأخبار",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (state is PostSuccess)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.posts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 0.85,
                            ),
                        itemBuilder: (context, index) {
                          final post = state.posts[index];
                          return GestureDetector(
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PostDetailScreen(post: post),
                                  ),
                                ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 3,
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: post.featuredImage!=null? Image.network(
                                      post.featuredImage!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      errorBuilder:
                                          (_, __, ___) => const Center(
                                            child: Icon(Icons.broken_image),
                                          ),
                                    ):
                                    Image.asset(
                                      'assets/images/image-error.png',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      errorBuilder:
                                          (_, __, ___) => const Center(
                                        child: Icon(Icons.broken_image),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      post.title.rendered,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  else
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("جاري تحميل الأخبار..."),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
