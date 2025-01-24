import 'package:tik_tok_wrapper/domain/datasources/video_post_datasource.dart';
import 'package:tik_tok_wrapper/domain/entities/video_post.dart';
import 'package:tik_tok_wrapper/domain/repositories/video_post_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  final VideoPostDataSource videoPostDataSource;

  VideoPostsRepositoryImpl({required this.videoPostDataSource});
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoPostDataSource.getTrendingVideosByPage(page);
  }
}
