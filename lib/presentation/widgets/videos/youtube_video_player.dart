import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class PortraitYoutubeVideoPlayer extends ConsumerStatefulWidget {
  const PortraitYoutubeVideoPlayer(
      {Key? key, required this.pVideo, required this.pIndex})
      : super(key: key);

  final Video pVideo;
  final int pIndex;
  @override
  PortraitYoutubeVideoPlayerState createState() =>
      PortraitYoutubeVideoPlayerState();
}

class PortraitYoutubeVideoPlayerState
    extends ConsumerState<PortraitYoutubeVideoPlayer> {
  late YoutubePlayerController _controller;
  bool close = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.pVideo.videoPath,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);

    return !close
        ? YoutubePlayerBuilder(
            onEnterFullScreen: () {
              ref.read(isPortraitProvider.notifier).update((state) => false);
            },
            player: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: theme.primary,
              topActions: [
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    widget.pVideo.videoName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
              onEnded: (data) {
                _controller.load(widget.pVideo.videoPath);
              },
            ),
            builder: (context, player) => Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  CustomAutoSizeText(
                      pText: widget.pVideo.videoName.isNotEmpty
                          ? widget.pVideo.videoName
                          : '',
                      pTextStyle: KCustomTextStyle.kSemiBold(
                          context, 55, theme.primary),
                      pWidth: maxSizePhone.maxWidth,
                      pHeight: maxSizePhone.maxHeight * 0.06,
                      pPadding: 0,
                      pTextAlign: TextAlign.start),
                  Stack(
                    children: [
                      player,
                      Positioned(
                          right: 0,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () {
                              ref
                                  .read(indexLandscapeVideoProvider.notifier)
                                  .update((state) => widget.pIndex);
                              ref
                                  .read(isPortraitProvider.notifier)
                                  .update((state) => false);
                              _controller.toggleFullScreenMode();
                            },
                            child: Container(
                              width: 50,
                              height: 40,
                              color: Colors.transparent,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          )
        : Container();
  }
}

class LandscapeYoutubeVideoPlayer extends ConsumerStatefulWidget {
  const LandscapeYoutubeVideoPlayer({Key? key, required this.video})
      : super(key: key);

  final Video video;
  @override
  LandscapeYoutubeVideoPlayerState createState() =>
      LandscapeYoutubeVideoPlayerState();
}

class LandscapeYoutubeVideoPlayerState
    extends ConsumerState<LandscapeYoutubeVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.video.videoPath,
      flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true),
    );
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        ref.read(isPortraitProvider.notifier).update((state) => true);
      },
      player: YoutubePlayer(
        controller: _controller,
        width: maxSizePhone.maxHeight,
        showVideoProgressIndicator: true,
        progressIndicatorColor: theme.primary,
        topActions: [
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              widget.video.videoName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
        onEnded: (data) {
          _controller.load(widget.video.videoPath);
        },
      ),
      builder: (context, player) => SizedBox(
          width: maxSizePhone.maxWidth,
          height: maxSizePhone.maxHeight,
          child: player),
    );
  }
}
