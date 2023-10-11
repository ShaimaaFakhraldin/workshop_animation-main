import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:workshop_animation/screens/transition/using_package/second_screen.dart';

class PackageScreen extends StatelessWidget {
  const PackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tranisiton Using Package"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          children: [
            _buildButton(context, PageTransitionType.fade, "fade transition"),
            _buildButton(context, PageTransitionType.bottomToTop,
                "bottom to top transition"),
            _buildButton(context, PageTransitionType.leftToRight,
                "left to right transition"),
            _buildButton(context, PageTransitionType.scale, "scale transition"),
            _buildButton(context, PageTransitionType.size, "size transition"),
            _buildButton(
                context, PageTransitionType.rotate, "rotate transition"),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(context, type, label) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context,
            PageTransition(
                child: const SecondScreen(),
                type: type,
                alignment: Alignment.bottomCenter,
                duration: const Duration(seconds: 1)));
      },
      color: Colors.deepOrange,
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
