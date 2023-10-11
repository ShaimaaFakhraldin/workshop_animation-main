import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottiesScreen extends StatefulWidget {
  const LottiesScreen({super.key});

  @override
  State<LottiesScreen> createState() => _LottiesScreenState();
}

class _LottiesScreenState extends State<LottiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lottie"),
      ),
      body: ListView(
        children: [
          Lottie.network(
            "https://assets6.lottiefiles.com/packages/lf20_rrw4rw07.json",
            errorBuilder: (context, error, stackTrace) =>
                Center(child: Text(error.toString())),
          ),
          Lottie.asset(
            'assets/lottie/cart.json',
          ),
          Lottie.asset(
            'assets/lottie/landing.json',
          ),
          Lottie.asset(
            'assets/lottie/loading.json',
          ),
          Lottie.asset("assets/lottie/animation_product.json"),
        ],
      ),
    );
  }
}
