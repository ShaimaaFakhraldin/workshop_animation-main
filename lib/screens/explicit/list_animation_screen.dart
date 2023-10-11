import 'package:flutter/material.dart';

class ListAnimationScreen extends StatefulWidget {
  const ListAnimationScreen({super.key});

  @override
  State<ListAnimationScreen> createState() => _ListAnimationScreenState();
}

class _ListAnimationScreenState extends State<ListAnimationScreen> {
  final List<Widget> _tripTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addTrips();
    });
  }

  void _addTrips() {
    List<Trip> _trips = [
      Trip(nights: "3", price: "350", title: "Beach Paradise"),
      Trip(nights: "5", price: "400", title: "City Break"),
      Trip(nights: "2", price: "750", title: "Ski Adventure"),
      Trip(nights: "4", price: "600", title: "Space Blast"),
      Trip(nights: "3", price: "350", title: "Beach Paradise"),
      Trip(nights: "5", price: "400", title: "City Break"),
      Trip(nights: "2", price: "750", title: "Ski Adventure"),
      Trip(nights: "4", price: "600", title: "Space Blast"),
      Trip(nights: "3", price: "350", title: "Beach Paradise"),
      Trip(nights: "5", price: "400", title: "City Break"),
      Trip(nights: "2", price: "750", title: "Ski Adventure"),
      Trip(nights: "4", price: "600", title: "Space Blast"),
    ];

    Future ft = Future(() {});
    for (var element in _trips) {
      ft = ft.then(
        (value) => Future.delayed(
          const Duration(milliseconds: 500),
        ).then(
          (value) {
            _tripTiles.add(_buildTile(element));
            _listKey.currentState!.insertItem(_tripTiles.length - 1);
          },
        ),
      );
    }
  }

  Widget _buildTile(Trip trip) {
    return Card(
      child: Container(
        color: Colors.black,
        child: ListTile(
          textColor: Colors.white,
          title: Text(trip.title),
          subtitle: Text(trip.nights),
          trailing: Text(trip.price),
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
          ),
        ),
      ),
    );
  }

  final Tween<Offset> _offset =
      Tween(begin: const Offset(-1, 0), end: const Offset(0, 0));

  final Tween<double> _opacity = Tween(begin: 0, end: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Animation"),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _tripTiles.length,
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            opacity: animation.drive(_opacity),
            child: SlideTransition(
              position: animation.drive(_offset),
              child: _tripTiles[index],
            ),
          );
        },
      ),
    );
  }
}

class Trip {
  String title;
  String price;
  String nights;

  Trip({required this.nights, required this.price, required this.title});
}
