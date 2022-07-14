import 'package:flutter/material.dart';
import 'dart:math';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({Key? key}) : super(key: key);

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _Button()),
    );
  }
}

class _Button extends StatefulWidget {
  const _Button({Key? key}) : super(key: key);

  @override
  State<_Button> createState() => _ButtonState();
}

class _ButtonState extends State<_Button>
    with SingleTickerProviderStateMixin<_Button> {
  late final AnimationController _controller;

  late final Animation<Offset> _offset;
  late final Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.5,
      vsync: this,
      duration: Duration(
        milliseconds: 800,
      ),
    )..repeat(reverse: true);

    _offset = Tween<Offset>(
      begin: const Offset(-10, 0),
      end: const Offset(10, 0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _rotation = Tween<double>(begin: -pi / 2, end: pi / 2).animate(_controller);
  }

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
        return Transform.rotate(
          angle: _rotation.value,
          child: Transform.translate(
            offset: _offset.value,
            child: child,
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Color(0xFF8DEBE5),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              color: Colors.black45,
              blurRadius: 10,
            )
          ],
        ),
        clipBehavior: Clip.hardEdge,
        width: 250,
        height: 56,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {},
            child: const Center(child: Text('TAP ME')),
          ),
        ),
      ),
    );
  }
}
