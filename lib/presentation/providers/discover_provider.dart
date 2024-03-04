import 'package:flutter/material.dart';
import 'package:toktik/config/domain/entities/video_post_entity.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  //todo: Repository, DataSource


  bool initialLoading = true;
  List<VideoPostEntity> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPostEntity> newVideos = videoPosts.map(
      (video) => LocalVideoModel.fromToJsonMap(video).toVideoPostEntity()
    ).toList();

    videos.addAll(newVideos);
    initialLoading = false;

    //todo: load differente videos
    notifyListeners();
  }

}