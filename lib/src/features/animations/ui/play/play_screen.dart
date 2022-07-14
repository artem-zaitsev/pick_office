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

class _Play extends StatelessWidget {
  const _Play({Key? key}) : super(key: key);

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
          onTap: () {},
          child: Center(
            child: Image.asset('assets/images/img_play.png'),
          ),
        ),
      ),
    );
  }
}
