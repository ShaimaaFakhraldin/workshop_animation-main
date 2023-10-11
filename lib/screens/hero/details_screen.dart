import 'package:flutter/material.dart';
import 'package:workshop_animation/screens/hero/item_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Hero(
                tag: item.title!,
                child: Image.network(
                  item.image!,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(10),
                child: Text(
                  item.body!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(50),
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width * .8,
              height: 50,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.deepOrange,
              child: const Text(
                "Visit",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
