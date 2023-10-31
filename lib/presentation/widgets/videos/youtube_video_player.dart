// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:revistabike_app/config/00-configs.dart';
// // import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

// // class YoutubeVideoPlayer extends ConsumerStatefulWidget {
// //   const YoutubeVideoPlayer({
// //     Key? key,
// //     required this.videoPath,
// //     required this.tittleWidth,
// //     required this.tittleHeight,
// //   }) : super(key: key);

// //   final String videoPath;

// //   final double tittleWidth;
// //   final double tittleHeight;

// //   @override
// //   YoutubeVideoPlayerState createState() => YoutubeVideoPlayerState();
// // }

// // class YoutubeVideoPlayerState extends ConsumerState<YoutubeVideoPlayer> {
// //   YoutubePlayerController? _controller;
// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = YoutubePlayerController(
// //         initialVideoId: widget.videoPath,
// //         flags: const YoutubePlayerFlags(
// //             autoPlay: false, mute: false, isLive: false));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final ColorScheme theme = Theme.of(context).colorScheme;
// //     void listener() {
// //       if (_controller?.value.errorCode != null) {
// //         print(_controller?.value.errorCode);
// //       }
// //     }

// //     return Padding(
// //       padding: const EdgeInsets.all(15),
// //       child: YoutubePlayer(
// //         controller: _controller!,
// //         showVideoProgressIndicator: true,
// //         progressIndicatorColor: theme.primary,
// //         progressColors: const ProgressBarColors(
// //             playedColor: Colors.red, handleColor: Colors.grey),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:revistabike_app/config/00-configs.dart';
// import 'package:revistabike_app/domain/entities/00-entities.dart';
// import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
// import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

// class YoutubeVideoPlayer extends ConsumerStatefulWidget {
//   final String videoId;
//   const YoutubeVideoPlayer({Key? key, required this.videoId}) : super(key: key);
//   @override
//   YoutubeVideoPlayerState createState() => YoutubeVideoPlayerState();
// }

// class YoutubeVideoPlayerState extends ConsumerState<YoutubeVideoPlayer> {
//   YoutubePlayerController? _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: widget.videoId,
//       flags: const YoutubePlayerFlags(
//         autoPlay: false,
//         mute: false,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   void listener() {
//     if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
//       setState(() {
//         _playerState = _controller.value.playerState;
//         _videoMetaData = _controller.metadata;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ColorScheme theme = Theme.of(context).colorScheme;
//     final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
//     return YoutubePlayerBuilder(
//         player: YoutubePlayer(
//           controller: _controller!,
//           showVideoProgressIndicator: true,
//           onReady: () {
//             _controller!.addListener(listener);
//           },
//           onEnded: (data) {
//             _controller!
//               ..load(widget.videoId)
//               ..play();
//             setState(() {});
//           },
//         ),
//         builder: (context, player) {
//           return Column(children: [
//             Padding(padding: const EdgeInsets.all(15), child: player)
//           ]);
//         });
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class YoutubeVideoPlayer extends ConsumerStatefulWidget {
  const YoutubeVideoPlayer({Key? key, required this.videoPath})
      : super(key: key);

  final String videoPath;
  @override
  YoutubeVideoPlayerState createState() => YoutubeVideoPlayerState();
}

class YoutubeVideoPlayerState extends ConsumerState<YoutubeVideoPlayer> {
  late YoutubePlayerController _controller;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoPath,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);

    _videoMetaData = const YoutubeMetaData();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _videoMetaData = _controller.metadata;
      });
    }
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
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: theme.primary,
        topActions: [
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          _controller.load(widget.videoPath);
        },
      ),
      builder: (context, player) => SizedBox(
        width: maxSizePhone.maxWidth,
        height: maxSizePhone.maxHeight * 0.4,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: player,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomAutoSizeText(
                      pText: _videoMetaData.title.isNotEmpty
                          ? 'Nombre ${_videoMetaData.title}'
                          : '',
                      pTextStyle: KCustomTextStyle.kSemiBold(
                          context, 55, theme.primary),
                      pWidth: maxSizePhone.maxWidth,
                      pHeight: maxSizePhone.maxHeight * 0.05,
                      pPadding: 0,
                      pTextAlign: TextAlign.start),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
