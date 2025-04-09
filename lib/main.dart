import 'package:flutter/material.dart';
import 'package:flutter_tok_tik/config/theme/app_theme.dart';
import 'package:flutter_tok_tik/infrastructure/models/datasources/local_video_post_datasource_impl.dart';
import 'package:flutter_tok_tik/infrastructure/repositories/video_post_repository_impl.dart';
import 'package:flutter_tok_tik/presentation/providers/dicover_provider.dart';
import 'package:flutter_tok_tik/presentation/screens/discover/dicover_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final VideoPostRepositoryImpl videoPostRepository = VideoPostRepositoryImpl(
      videoPostDatasource: LocalVideoPostDatasourceImpl(),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create:
              (_) =>
                  DiscoverProvider(videoPostRepository: videoPostRepository)
                    ..loadNextPage(),
        ),
      ],
      child: MaterialApp(
        title: 'TokTik',
        theme: AppTheme().getTheme(),
        home: DiscoverScreen(),
      ),
    );
  }
}
