import 'package:flutter/material.dart';
import 'package:tik_tok_wrapper/domain/entities/video_post.dart';
import 'package:tik_tok_wrapper/presentation/widgets/shared/video_buttons.dart';
import 'package:tik_tok_wrapper/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return Stack(
          children: [
            SizedBox.expand(
                child: FullscreenPlayer(
              caption: video.caption,
              videoUrl: video.videoUrl,
            )),
            Positioned(
                bottom: 40, right: 20, child: VideoButtons(video: video)),
          ],
        );
      },
    );
  }
}
