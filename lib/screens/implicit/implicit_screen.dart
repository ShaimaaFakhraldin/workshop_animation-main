import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitScreen extends StatefulWidget {
  const ImplicitScreen({super.key});

  @override
  State<ImplicitScreen> createState() => _ImplicitScreenState();
}

class _ImplicitScreenState extends State<ImplicitScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  var first = true;
  double randomBorderRadius() {
    return Random().nextDouble() * 64;
  }

  double randomMargin() {
    return Random().nextDouble() * 64;
  }

  double randomWidth() {
    return Random().nextDouble() * 64;
  }

  double randomHeight() {
    return Random().nextDouble() * 64;
  }

  Color randomColor() {
    return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    color = randomColor();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
    width = randomWidth();
    height = randomHeight();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..forward()
      ..repeat(reverse: true);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animations"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! Animation Opacity
            _buildAnimatedOpacity(),
            const SizedBox(height: 100),

            //! Animated Container
            _buildAnimatedContainer(),
            const SizedBox(height: 100),

            //! Animated Scale
            _buildAnimatedScale(),
            const SizedBox(height: 100),

            //! Animated Positioned
            _buildAnimatedPostitoned(),
            const SizedBox(height: 100),

            //! Animated Rotation
            _buildAnimatedRotation(),
            const SizedBox(height: 100),

            //! Cross Fade
            _buildCrossFade(),
            const SizedBox(height: 100),

            //! Animated Icon
            _buildAnimatedIcon(),
          ],
        ),
      ),
    );
  }

  _buildAnimatedIcon() {
    return Column(
      children: [
        AnimatedIcon(
          icon: AnimatedIcons.ellipsis_search,
          progress: animation,
          size: 72.0,
          semanticLabel: "Show Menu",
        )
      ],
    );
  }

  CrossFadeState state = CrossFadeState.showFirst;
  _buildCrossFade() {
    return Column(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: AnimatedCrossFade(
              firstChild: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
              secondChild: const Text("Cross Fade"),
              crossFadeState: state,
              duration: const Duration(seconds: 1)),
        ),
        ElevatedButton(
          child: const Text('Start'),
          onPressed: () {
            if (state == CrossFadeState.showFirst) {
              setState(() {
                state = CrossFadeState.showSecond;
              });
            } else {
              setState(() {
                state = CrossFadeState.showFirst;
              });
            }
          },
        )
      ],
    );
  }

  double rotation = 0;
  _buildAnimatedRotation() {
    return Column(
      children: [
        AnimatedRotation(
          turns: rotation,
          duration: const Duration(seconds: 1),
          child: const Text("Test Rotation"),
        ),
        ElevatedButton(
          child: const Text('Start'),
          onPressed: () {
            if (rotation == 0) {
              setState(() {
                rotation = 1;
              });
            } else {
              setState(() {
                rotation = 0;
              });
            }
          },
        )
      ],
    );
  }

  double top = 0;
  double bottom = 0;
  double left = 0;
  double right = 0;
  _buildAnimatedPostitoned() {
    return Column(
      children: [
        Container(
          color: Colors.black,
          height: 200,
          width: 200,
          child: Stack(
            children: [
              AnimatedPositioned(
                onEnd: () {
                  if (top == 0 && right == 0) {
                    setState(() {
                      top = 50;
                      right = 100;
                    });
                  } else {
                    setState(() {
                      top = 0;
                      right = 0;
                    });
                  }
                },
                duration: const Duration(seconds: 1),
                top: top,
                right: right,
                child: Container(
                  color: Colors.red,
                  width: 50,
                  height: 50,
                ),
              ),
              AnimatedPositioned(
                onEnd: () {
                  if (left == 0 && bottom == 0) {
                    setState(() {
                      left = 50;
                      bottom = 100;
                    });
                  } else {
                    setState(() {
                      left = 0;
                      bottom = 0;
                    });
                  }
                },
                duration: const Duration(seconds: 1),
                bottom: bottom,
                left: left,
                child: Container(
                  color: Colors.blue,
                  width: 50,
                  height: 50,
                ),
              )
            ],
          ),
        ),
        ElevatedButton(
          child: const Text('Start'),
          onPressed: () {
            setState(() {
              top = 50;
              left = 50;
              right = 100;
              bottom = 100;
            });
          },
        )
      ],
    );
  }

  double scale = 0.0;
  _buildAnimatedScale() {
    return Column(
      children: [
        AnimatedScale(
          scale: scale,
          alignment: Alignment.center,
          duration: const Duration(seconds: 1),
          child: const Text("Test Scale"),
        ),
        ElevatedButton(
          child: const Text('change'),
          onPressed: () {
            if (scale == 0) {
              setState(() {
                scale = 1.0;
              });
            } else {
              setState(() {
                scale = 0.0;
              });
            }
          },
        )
      ],
    );
  }

  late Color color;
  late double borderRadius;
  late double margin;
  late double width;
  late double height;
  _buildAnimatedContainer() {
    return Column(
      children: [
        SizedBox(
          width: 128,
          height: 128,
          child: AnimatedContainer(
            width: width,
            height: height,
            duration: const Duration(milliseconds: 500),
            margin: EdgeInsets.all(margin),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        ElevatedButton(
          child: const Text('change'),
          onPressed: () => change(),
        )
      ],
    );
  }

  double opacity = 0.0;
  _buildAnimatedOpacity() {
    return Column(
      children: [
        AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 500),
          child: Column(
            children: const [
              Text('Type: Owl'),
              Text('Age: 39'),
              Text('Employment: None'),
            ],
          ),
        ),
        ElevatedButton(
            onPressed: () {
              if (opacity == 0) {
                setState(() {
                  opacity = 1;
                });
              } else {
                setState(() {
                  opacity = 0;
                });
              }
            },
            child: const Text("Show Text Fade Animation")),
      ],
    );
  }

  void change() {
    setState(() {
      color = randomColor();
      borderRadius = randomBorderRadius();
      margin = randomMargin();
      width = randomWidth();
      height = randomHeight();
    });
  }
}
