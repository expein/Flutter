import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/config/helper/human_formats.dart';
import 'package:tiktok/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButtom(value: video.likes, iconData: Icons.favorite, iconColor: Colors.red),
        _CustomIconButtom(value: video.views, iconData: Icons.remove_red_eye_outlined),
        BounceInDown(
          child: const _CustomIconButtom(value: 0, iconData: Icons.play_circle_outline)
          )
      ],
    );
  }
}

class _CustomIconButtom extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButtom({
    required this.value,
    required this.iconData,
    iconColor
  }): color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconData, 
              color: color,
              size: 30,
            )),
            if(value > 0)
            Text(HumanFormats.humanReadbleNumber(value.toDouble()))
      ],
    );
  }
}
