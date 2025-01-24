import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tok_wrapper/config/theme/app_theme.dart';
import 'package:tik_tok_wrapper/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tik_tok_wrapper/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:tik_tok_wrapper/presentation/providers/discover_provider.dart';
import 'package:tik_tok_wrapper/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostsRepositoryImpl(
        videoPostDataSource: LocalVideoDatasourceImpl());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                DiscoverProvider(videoPostRepository: videoPostRepository)
                  ..fetchVideos()),
      ],
      child: MaterialApp(
        title: 'TikTok',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
