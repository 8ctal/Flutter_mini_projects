import 'package:flutter/material.dart';
import 'package:tik_tok_wrapper/domain/entities/video_post.dart';
import 'package:tik_tok_wrapper/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videoPostRepository;

  bool isFetching = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostRepository});

  Future<void> fetchVideos() async {
    final newVideos = await videoPostRepository.getTrendingVideosByPage(1);
    videos.addAll(newVideos);
    isFetching = false;
    notifyListeners();
  }
}
