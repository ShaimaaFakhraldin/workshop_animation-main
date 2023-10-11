import 'package:flutter/material.dart';

class AnimationUsingPackagesScreen extends StatefulWidget {
  const AnimationUsingPackagesScreen({super.key});

  @override
  State<AnimationUsingPackagesScreen> createState() =>
      _AnimationUsingPackagesScreenState();
}

class _AnimationUsingPackagesScreenState
    extends State<AnimationUsingPackagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Using Packages"),
      ),
    );
  }
}
