import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class CustomLoadingAnimated extends ConsumerStatefulWidget {
  const CustomLoadingAnimated({super.key});

  @override
  CustomLoadingAnimatedState createState() => CustomLoadingAnimatedState();
}

class CustomLoadingAnimatedState extends ConsumerState<CustomLoadingAnimated>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  int dotCount = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        if (dotCount < 5) {
          dotCount++;
        } else {
          dotCount = 0;
        }
      });
    });
    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    timer.cancel();
    super.dispose();
  }

  void _startAnimation() {
    _controller
      ..stop()
      ..reset()
      ..repeat(period: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    String loadingText = 'Cargando${'.' * dotCount}';
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    final ColorScheme theme = Theme.of(context).colorScheme;
    return Scaffold(
        body: Stack(
      children: [
        _PainterCircle(controller: _controller, pSize: maxSizePhone),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: maxSizePhone.maxHeight * 0.14),
            _BicycleGif(pSize: maxSizePhone),
            SizedBox(height: maxSizePhone.maxHeight * 0.1),
            _TextLoading(loadingText: loadingText, theme: theme)
          ],
        ),
      ],
    ));
  }
}

class _TextLoading extends ConsumerWidget {
  const _TextLoading({
    required this.loadingText,
    required this.theme,
  });

  final String loadingText;
  final ColorScheme theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    return Center(
      child: CustomAutoSizeText(
          pText: loadingText,
          pTextStyle: KCustomTextStyle.kSemiBold(context, 35, theme.primary),
          pWidth: maxSizePhone.maxWidth,
          pHeight: maxSizePhone.maxHeight * 0.05,
          pPadding: 0),
    );
  }
}

class _BicycleGif extends StatelessWidget {
  const _BicycleGif({required this.pSize});

  final MaxSizePhone pSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: pSize.maxWidth * 0.4,
      height: pSize.maxHeight * 0.2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          loadingImagePath,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class _PainterCircle extends StatelessWidget {
  const _PainterCircle({
    required AnimationController controller,
    required this.pSize,
  }) : _controller = controller;

  final AnimationController _controller;
  final MaxSizePhone pSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: SpritePainter(_controller),
        child: SizedBox(
          width: pSize.maxWidth * 0.8,
          height: pSize.maxHeight * 0.5,
        ),
      ),
    );
  }
}

class SpritePainter extends CustomPainter {
  final Animation<double> _animation;

  SpritePainter(this._animation) : super(repaint: _animation);

  void circle(Canvas canvas, Rect rect, double value) {
    double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    Color color = Color.fromRGBO(0, 117, 194, opacity);

    double size = rect.width / 2;
    double area = size * size;
    double radius = sqrt(area * value / 4);

    final Paint paint = Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(SpritePainter oldDelegate) {
    return true;
  }
}
