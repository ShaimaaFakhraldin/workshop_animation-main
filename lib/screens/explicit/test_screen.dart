import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen>
    with SingleTickerProviderStateMixin {
  //! 1- declare animation type
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  //! 2- declare animation controller
  late AnimationController _controller;

  bool favourite = false;

  @override
  void initState() {
    //! 3- init controller + add with SingleTickerProviderStateMixin in class
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    //! 4- init animation
    // _sizeAnimation = Tween<double>(begin: 25.0, end: 50.0).animate(_controller);

    //! make many tweens(begin , end) in one animation
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 75), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 75, end: 50), weight: 50),
    ]).animate(_controller);

    // _colorAnimation = TweenSequence(<TweenSequenceItem<Color>>[
    //   TweenSequenceItem<Color>(
    //       tween: Tween<Color>(begin: Colors.grey, end: Colors.red), weight: 50),
    //   TweenSequenceItem<Color>(
    //       tween: Tween<Color>(begin: Colors.red, end: Colors.grey), weight: 50),
    // ]).animate(_controller);

    _colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(_controller);

    //! to get current value
    _controller.addListener(() {
      // print(_sizeAnimation.value);
    });

    //! to get current state of controller
    _controller.addStatusListener((status) {
      print(status);
    });

    //! 5- run controller animation
    // _controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Animation"),
        actions: [
          IconButton(
            onPressed: () {
              _controller.stop();
            },
            icon: const Icon(Icons.stop),
          ),
          IconButton(
            onPressed: () {
              _controller.reset();
            },
            icon: const Icon(Icons.restore),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //! 5- run controller animation
          _controller.forward();
          // _controller
          //   ..forward()
          //   ..repeat(reverse: true);
        },
        backgroundColor: Colors.deepOrange,
        child: const Icon(
          Icons.play_arrow,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return IconButton(
              onPressed: () {
                favourite ? _controller.reverse() : _controller.forward();

                favourite = !favourite;
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
      // body: Center(
      //   child: AnimatedBuilder(
      //     animation: _controller,
      //     builder: (context, child) {
      //       return Text(
      //         "Test Animation",
      //         style: TextStyle(
      //           fontSize: _sizeAnimation.value,
      //           color: _colorAnimation.value,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
