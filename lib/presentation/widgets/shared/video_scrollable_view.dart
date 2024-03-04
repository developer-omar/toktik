import 'package:flutter/material.dart';
import 'package:toktik/config/domain/entities/video_post_entity.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPostEntity> videos;

  const VideoScrollableView({
    super.key,
    required this.videos

  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPostEntity = videos[index];
        return Stack(
          children: [
            //video player + gradiente
            //FullScreenPlayer(video: videoPostEntity),
            SizedBox.expand(
              child: FullScreenPlayer(
                caption: videoPostEntity.caption,
                videoUrl: videoPostEntity.videoUrl,
              ),
            ),
            //botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPostEntity)
            )
          ],
        );
      },
    );
  }
}