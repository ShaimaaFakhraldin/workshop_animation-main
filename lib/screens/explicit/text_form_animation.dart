import 'package:flutter/material.dart';

class TextFormAnimation extends StatefulWidget {
  const TextFormAnimation({super.key});

  @override
  State<TextFormAnimation> createState() => _TextFormAnimationState();
}

class _TextFormAnimationState extends State<TextFormAnimation>
    with SingleTickerProviderStateMixin {
  var _key = GlobalKey<FormState>();
  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _buildAnimation();
  }

  _buildAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _offsetAnimation = TweenSequence(
      <TweenSequenceItem<Offset>>[
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(begin: Offset(0, 0), end: Offset(-.03, 0)),
          weight: 25,
        ),
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(begin: Offset(-.03, 0), end: Offset(0, 0)),
          weight: 25,
        ),
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(begin: Offset(0, 0), end: Offset(.03, 0)),
          weight: 25,
        ),
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(begin: Offset(.03, 0), end: Offset(0, 0)),
          weight: 25,
        ),
      ],
    ).animate(_controller!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Form Animation"),
      ),
      body: Form(
        key: _key,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: ListView(
            children: [
              AnimatedBuilder(
                animation: _controller!,
                builder: (context, child) {
                  return SlideTransition(
                    position: _offsetAnimation!,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email Or Phone Cannot be empty";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Email or Phone",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 25),
              AnimatedBuilder(
                animation: _controller!,
                builder: (context, child) {
                  return SlideTransition(
                    position: _offsetAnimation!,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password Cannot be empty";
                        } else if (value.length < 6) {
                          return "length must be more than 6 chars";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 50),
              MaterialButton(
                onPressed: () {
                  if (!_key.currentState!.validate()) {
                    if (!_controller!.isAnimating) {
                      _controller!
                        ..forward()
                        ..repeat();

                      Future.delayed(const Duration(seconds: 1)).then((value) {
                        _controller!.stop();
                        _controller!.reset();
                      });
                    }
                  } else {
                    if (_controller!.isAnimating) {
                      _controller!.stop();
                      _controller!.reset();
                    }
                  }
                },
                color: Colors.deepOrange,
                textColor: Colors.white,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
