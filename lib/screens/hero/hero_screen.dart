import 'package:flutter/material.dart';
import 'package:workshop_animation/screens/hero/details_screen.dart';
import 'package:workshop_animation/screens/hero/item_model.dart';

class HeroScreen extends StatelessWidget {
  HeroScreen({super.key});

  final List<ItemModel> items = [
    ItemModel(
      image:
          "https://media.istockphoto.com/id/177047347/photo/the-pyramids-of-giza.jpg?s=612x612&w=0&k=20&c=sNOn3ruKWcJD1bqi4AVgU7yNt7nChIA30oLfUfsZ4Ro=",
      title: "Pyramids Giza",
      body:
          "The Great Pyramid of Giza is the largest Egyptian pyramid and the tomb of Fourth Dynasty pharaoh Khufu",
    ),
    ItemModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/b/b2/%D8%A8%D8%A7%D9%86%D9%88%D8%B1%D8%A7%D9%85%D8%A7_%D9%85%D9%86_%D8%AF%D8%A7%D8%AE%D9%84_%D9%85%D8%B9%D8%A8%D8%AF_%D8%A7%D9%84%D8%A7%D9%82%D8%B5%D8%B1.jpg",
      title: "Luxor",
      body:
          "Luxor is a city on the east bank of the Nile River in southern Egypt.",
    ),
    ItemModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/2/2f/Alexandria_-_Egypt.jpg",
      title: "Alexandria",
      body:
          "Alexandria is a Mediterranean port city in Egypt. During the Hellenistic period.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero"),
      ),
      body: ListView(
        children: [
          ...items.map(
            (e) => ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => DetailsScreen(item: e)));
              },
              title: Text(e.title!),
              subtitle: Text(e.body!),
              leading: Hero(
                tag: e.title!,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(e.image!),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
