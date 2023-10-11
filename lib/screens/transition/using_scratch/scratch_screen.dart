import 'package:flutter/material.dart';
import 'package:workshop_animation/screens/transition/using_package/second_screen.dart';

class ScratchScreen extends StatelessWidget {
  const ScratchScreen({super.key});

  Route _buildRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 1),
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SecondScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //! Rotate
        var begin = 0.0;
        var end = 1.0;

        var tween = Tween(begin: begin, end: end);
        var anim = animation.drive(tween);

        //! Scale
        var begin2 = 0.0;
        var end2 = 1.0;

        var tween2 = Tween(begin: begin2, end: end2);
        var anim2 = animation.drive(tween2);

        //! Fade
        var begin3 = 0.0;
        var end3 = 1.0;

        var tween3 = Tween(begin: begin3, end: end3);
        var anim3 = animation.drive(tween3);

        return FadeTransition(
          opacity: anim3,
          child: RotationTransition(
            turns: anim,
            // alignment: Alignment.topCenter,
            child: ScaleTransition(
              scale: anim2,
              child: child,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tranisiton Using Scratch Code"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, _buildRoute());
                },
                child: Text("go To Screen 2")),
            _buildButton(context, "bottom to top transition", () {
              Navigator.of(context).push(_bottomToTop());
            }),
            _buildButton(context, "top to bottom transition", () {
              Navigator.of(context).push(_topToBottom());
            }),
            _buildButton(context, "left to right transition", () {
              Navigator.of(context).push(_leftToRight());
            }),
            _buildButton(context, "right to left transition", () {
              Navigator.of(context).push(_rightToLeft());
            }),
            _buildButton(context, "fade transition", () {
              Navigator.of(context).push(_fade());
            }),
            _buildButton(context, "scale transition", () {
              Navigator.of(context).push(_scale());
            }),
            _buildButton(context, "rotate transition", () {
              Navigator.of(context).push(_rotate());
            }),
            _buildButton(context, "combine Bottom to top with fade transtitons",
                () {
              Navigator.of(context)
                  .push(_combineSlideFromBottomToTopWithFade());
            }),
            _buildButton(
                context, "combine Left To Right with Rotate transtitons", () {
              Navigator.of(context)
                  .push(_combineSlideFromLeftToRightWithRotate());
            }),
          ],
        ),
      ),
    );
  }

  Route _combineSlideFromLeftToRightWithRotate() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SecondScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //! Slide Tranisiton
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;

        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        //! ----------------------------------------

        //! Rotate Tranisiton
        const begin2 = 0.0;
        const end2 = 1.0;
        final tween2 = Tween(begin: begin2, end: end2);
        final rotateAnimation = animation.drive(tween2);

        //! ----------------------------------------

        return SlideTransition(
          position: offsetAnimation,
          child: RotationTransition(
            turns: rotateAnimation,
            child: child,
          ),
        );
      },
    );
  }

  Route _combineSlideFromBottomToTopWithFade() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SecondScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //! Slide Tranisiton
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;

        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        //! ----------------------------------------

        //! Fade Tranisiton
        const begin2 = 0.0;
        const end2 = 1.0;
        final tween2 = Tween(begin: begin2, end: end2);
        final fadeAnimation = animation.drive(tween2);

        //! ----------------------------------------

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: child,
          ),
        );
      },
    );
  }

  Route _rotate() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SecondScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        var curve = Curves.fastLinearToSlowEaseIn;
        var curveTween = CurveTween(curve: curve);
        final tween = Tween(begin: begin, end: end).chain(curveTween);
        final offsetAnimation = animation.drive(tween);
        return RotationTransition(
          turns: offsetAnimation,
          child: child,
        );
      },
    );
  }

  Route _scale() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SecondScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return ScaleTransition(
          scale: offsetAnimation,
          alignment: Alignment.topLeft,
          child: child,
        );
      },
    );
  }

  Route _fade() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SecondScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return FadeTransition(
          opacity: offsetAnimation,
          child: child,
        );
      },
    );
  }

  Route _rightToLeft() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SecondScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  Route _leftToRight() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SecondScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  Route _topToBottom() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SecondScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, -1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  Route _bottomToTop() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SecondScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;

        final tween = Tween(begin: begin, end: end);

        final slideAnimation = animation.drive(tween);

        return SlideTransition(
          position: slideAnimation,
          child: child,
        );
      },
    );
  }

  Widget _buildButton(context, label, function) {
    return MaterialButton(
      onPressed: function,
      color: Colors.deepOrange,
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
