import 'package:flutter/material.dart';
import 'package:flutter_tok_tik/domain/entities/video_post.dart';
import 'package:flutter_tok_tik/presentation/widgets/shared/video_buttons.dart';
import 'package:flutter_tok_tik/presentation/widgets/video/fullscreen_player.dart';

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
        final VideoPost video = videos[index];
        return Stack(
          children: [
            FullscreenPlayer(videoUrl: video.videoUrl, caption: video.caption),
            Positioned(
              bottom: 10,
              right: 10,
              child: VideoButtons(video: video),
            ),
          ],
        );
      },
    );
  }
}
