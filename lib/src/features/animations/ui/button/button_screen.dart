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
    with TickerProviderStateMixin<_Button> {
  late final AnimationController _controller;

  late final AnimationController _scaleController;

  late final Animation<double> _radius;
  late final Animation<double> _scaleOut;
  late final Animation<double> _scaleIn;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 400,
      ),
    )..repeat();

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 600,
      ),
    );

    _radius = Tween<double>(begin: 0, end: 3).animate(_controller);

    _scaleOut = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Interval(
          0,
          0.5,
        ),
      ),
    );

    _scaleIn = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Interval(
          0.5,
          1,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ScaleTransition(
            scale: _scaleIn,
            child: Center(
              child: GestureDetector(
                onTap: _handleTap,
                child: _Loader(),
              ),
            ),
          ),
        ),
        Center(
          child: ScaleTransition(
            scale: _scaleOut,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (ctx, child) {
                return Container(
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
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          Colors.white,
                          Colors.white.withOpacity(0.07),
                        ],
                        radius: _radius.value,
                      ),
                    ),
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        onTap: _handleTap,
                        child: const Center(child: Text('TAP ME')),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  void _handleTap() {
    if (_isLoading) {
      _scaleController.reverse();
    } else {
      _scaleController.forward();
    }

    setState(() {
      _isLoading = !_isLoading;
    });
  }
}

class _Loader extends StatelessWidget {
  const _Loader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 49,
      height: 49,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFFE3D3D),
      ),
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(11),
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
