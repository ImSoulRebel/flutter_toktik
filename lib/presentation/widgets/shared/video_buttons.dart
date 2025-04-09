import 'package:flutter/material.dart';
import 'package:flutter_tok_tik/config/helpers/human_formats.dart';
import 'package:flutter_tok_tik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        _CustomIconButton(
          value: video.likes,
          iconData: Icons.favorite,
          onPressed: () {},
          color: Colors.red,
        ),
        _CustomIconButton(
          value: video.views,
          iconData: Icons.remove_red_eye_outlined,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final VoidCallback onPressed;
  final Color? color;

  const _CustomIconButton({
    required this.value,
    required this.iconData,
    required this.onPressed,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Column(
        children: [
          Icon(iconData, size: 30),
          Text(HumanFormats.humanReadableNumber(value.toDouble())),
        ],
      ),
      color: color,
    );
  }
}
