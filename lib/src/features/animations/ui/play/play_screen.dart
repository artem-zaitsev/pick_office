import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

const _redColor = Color(0xFFFE3D3D);

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _Play()),
    );
  }
}

class _Play extends StatefulWidget {
  const _Play({Key? key}) : super(key: key);

  @override
  State<_Play> createState() => _PlayState();
}

class _PlayState extends State<_Play> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (!_isPlaying) const _AnimatedContainer(),
        if (_isPlaying) const _Loader(),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                _redColor,
                Color(0xFF8DEBE5),
              ],
            ),
          ),
          clipBehavior: Clip.hardEdge,
          width: 250,
          height: 250,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () {
                setState(() {
                  _isPlaying = !_isPlaying;
                });
              },
              child: Center(
                child: _isPlaying
                    ? _Stop()
                    : Image.asset('assets/images/img_play.png'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Stop extends StatelessWidget {
  const _Stop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            _redColor,
            Color(0xFF8DEBE5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

class _AnimatedContainer extends StatefulWidget {
  const _AnimatedContainer({Key? key}) : super(key: key);

  @override
  State<_AnimatedContainer> createState() => __AnimatedContainerState();
}

class __AnimatedContainerState extends State<_AnimatedContainer>
    with SingleTickerProviderStateMixin<_AnimatedContainer> {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  )..repeat();

  late final _size = SizeTween(
    begin: const Size(210, 210),
    end: const Size(350, 350),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0,
        0.66,
        curve: Curves.easeIn,
      ),
    ),
  );

  late final _opacity = Tween<double>(
    begin: 1,
    end: 0,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.66,
        1,
        curve: Curves.easeOut,
      ),
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (ctx, child) {
        return Opacity(
          opacity: _opacity.value,
          child: SizedBox.fromSize(
            size: _size.value,
            child: child,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: _redColor,
            width: 2,
          ),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(39),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: _redColor,
              width: 2,
            ),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _Loader extends StatefulWidget {
  const _Loader({Key? key}) : super(key: key);

  @override
  State<_Loader> createState() => __LoaderState();
}

class __LoaderState extends State<_Loader> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 1000,
    ),
  )..repeat();

  late final _rotation = Tween<double>(
    begin: 0,
    end: pi * 2,
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (ctx, child) => Transform.rotate(
        angle: _rotation.value,
        child: child,
      ),
      child: SizedBox(
        width: 258,
        height: 258,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    _redColor,
                    Color(0xFF8DEBE5),
                  ],
                ),
                shape: BoxShape.circle,
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Container(color: Colors.transparent),
            )
          ],
        ),
      ),
    );
  }
}
