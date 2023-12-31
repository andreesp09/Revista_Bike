import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';
import 'package:revistabike_app/presentation/widgets/videos/youtube_video_player.dart';

class PrincipalVideosScreen extends ConsumerWidget {
  static const name = 'principal-videos-screen';
  const PrincipalVideosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    final List<Video> videos = ref.watch(videosProvider);
    final bool isPortraitScreen = ref.watch(isPortraitProvider);
    final bool userCloseScreen = ref.watch(canClose);

    void returnVideoScreen() {
      ref.read(canClose.notifier).update((state) => true);
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      context.pop();
    }

    return Scaffold(
      appBar: isPortraitScreen
          ? CustomAppBar(
              pWidth: maxSizePhone.maxWidth * 0.15,
              pHeight: maxSizePhone.maxHeight * 0.08,
              pIconSize: maxSizePhone.maxHeight * 0.04,
              pColor: theme.primary,
              pOnTap: returnVideoScreen)
          : null,
      body: isPortraitScreen
          ? ListView.builder(
              itemCount: videos.length,
              itemBuilder: (BuildContext context, int index) {
                final Video video = videos[index];
                return userCloseScreen
                    ? Container()
                    : PortraitYoutubeVideoPlayer(
                        pVideo: video,
                        pIndex: index,
                      );
              },
            )
          : LandscapeYoutubeVideoPlayer(
              video: videos[ref.read(indexLandscapeVideoProvider)]),
    );
  }
}
