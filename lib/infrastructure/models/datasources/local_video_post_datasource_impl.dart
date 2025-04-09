import 'package:flutter_tok_tik/domain/datasources/video_post_datasource.dart';
import 'package:flutter_tok_tik/domain/entities/video_post.dart';
import 'package:flutter_tok_tik/infrastructure/models/local_video_model.dart';
import 'package:flutter_tok_tik/shared/data/local_video_post.dart';

class LocalVideoPostDatasourceImpl implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideoPosts =
        videoPosts
            .map(
              (videoPost) =>
                  LocalVideoModel.fromJson(videoPost).toVideoPostEntity(),
            )
            .toList();

    return newVideoPosts;
  }
}
