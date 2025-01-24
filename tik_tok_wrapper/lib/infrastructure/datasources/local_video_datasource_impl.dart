import 'package:tik_tok_wrapper/domain/datasources/video_post_datasource.dart';
import 'package:tik_tok_wrapper/domain/entities/video_post.dart';
import 'package:tik_tok_wrapper/infrastructure/models/local_video_model.dart';
import 'package:tik_tok_wrapper/shared/data/local_video_posts.dart';

class LocalVideoDatasourceImpl implements VideoPostDataSource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();
    return newVideos;
  }
}
