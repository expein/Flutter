import 'package:tiktok/domain/entities/video_post.dart';

class LocalVideoModel {
  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    required this.likes,
    required this.views,
  });

  final String name;
  final String videoUrl;
  final int likes;
  final int views;


  factory LocalVideoModel.fromJsonMap(Map<String, dynamic> json) => LocalVideoModel(
    name: json["name"] ?? "No hay nombre", 
    videoUrl: json["videoUrl"], 
    likes: json["likes"] ?? 0, 
    views: json["views"] ?? 0
    );

  VideoPost toVideoPostEntity() => VideoPost(
    caption: name, 
    videoUrl: videoUrl,
    likes: likes,
    views: views
    );
}