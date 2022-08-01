import 'package:flutter/material.dart';

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
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xFFFE3D3D),
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
            Color(0xFFFE3D3D),
            Color(0xFF8DEBE5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
