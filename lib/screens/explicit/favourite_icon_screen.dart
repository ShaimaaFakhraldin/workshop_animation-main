import 'package:flutter/material.dart';

class FavouriteIconScreen extends StatefulWidget {
  const FavouriteIconScreen({super.key});

  @override
  State<FavouriteIconScreen> createState() => _FavouriteIconScreenState();
}

class _FavouriteIconScreenState extends State<FavouriteIconScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Color?> _colorAnimation;
  late Animation<double?> _sizeAnimation;

  bool isFav = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(_controller);

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 30, end: 50), weight: 50),
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 50, end: 30), weight: 50)
      ],
    ).animate(_controller);

    _controller.addListener(() {
      print(_controller.value);
      print(_colorAnimation.value);
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explicit Animations"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return IconButton(
              onPressed: () {
                isFav ? _controller.reverse() : _controller.forward();
              },
              icon: Icon(
                Icons.favorite,
                color: _colorAnimation.value,
                size: _sizeAnimation.value,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
