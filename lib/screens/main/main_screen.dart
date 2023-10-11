import 'package:flutter/material.dart';
import 'package:workshop_animation/screens/explicit/favourite_icon_screen.dart';
import 'package:workshop_animation/screens/explicit/list_animation_screen.dart';
import 'package:workshop_animation/screens/explicit/text_form_animation.dart';
import 'package:workshop_animation/screens/hero/hero_screen.dart';
import 'package:workshop_animation/screens/implicit/implicit_screen.dart';
import 'package:workshop_animation/screens/lottie/lotteis_screen.dart';
import 'package:workshop_animation/screens/transition/using_package/package_screen.dart';
import 'package:workshop_animation/screens/transition/using_scratch/scratch_screen.dart';

import '../explicit/test_screen2.dart';
import '../full_samples/validation_animation_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Workshop"),
      ),
      body: ListView(
        children: [
          _buildListTile(
              context, "Lottie Animation", "1", const LottiesScreen()),
          _buildListTile(context, "Hero Animation", "2", HeroScreen()),
          _buildListTile(context, "Transition Animation using package", "3",
              const PackageScreen()),
          _buildListTile(context, "Transition Animation using scratch", "4",
              const ScratchScreen()),
          _buildListTile(
              context, "Implicit Animation", "5", const ImplicitScreen()),
          _buildListTile(
              context, "List Animation", "6", const ListAnimationScreen()),
          _buildListTile(
              context, "Favourite Animation", "7", const FavouriteIconScreen()),
          _buildListTile(context, "Text Form Validation Animation", "8",
              const TextFormAnimation()),
          _buildListTile(context, "ValidationSamplesScreen", "9",
              const ValidationSamplesScreen()),
          _buildListTile(context, "TestScreen2", "11", const TestScreen2()),
        ],
      ),
    );
  }

  _buildListTile(context, label, id, screen) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.deepOrange,
        child: Text(
          id,
          style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text(label),
      onTap: () {
        goTo(screen, context);
      },
    );
  }

  goTo(screen, context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }
}
