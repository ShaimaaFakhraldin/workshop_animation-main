import 'package:flutter/material.dart';

class TestScreen2 extends StatefulWidget {
  const TestScreen2({super.key});

  @override
  State<TestScreen2> createState() => _TestScreen2State();
}

class _TestScreen2State extends State<TestScreen2> {
  List<UserChat> chats = [];
  List<Widget> chatsTiles = [];

  GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addChats();
    });

    super.initState();
  }

  _addChats() {
    //! get Data
    chats.addAll([
      UserChat(
        image:
            "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
        message: "From Abanoub to Eslam",
        name: "Eslam Fareed",
      ),
      UserChat(
        image:
            "https://images.unsplash.com/photo-1581456495146-65a71b2c8e52?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
        message: "Hello, i can understand this session as well",
        name: "Abanoub George",
      ),
      UserChat(
        image:
            "https://images.ctfassets.net/hrltx12pl8hq/3KWcqxPlvmgkpMS5VdjLAk/3cbdd812faf4b8c343b259656d31a0ee/rendered_15.jpg?fit=fill&w=600&h=338",
        message: "Rania could do it be herself",
        name: "Rania",
      ),
      UserChat(
        image:
            "https://images.ctfassets.net/hrltx12pl8hq/3KWcqxPlvmgkpMS5VdjLAk/3cbdd812faf4b8c343b259656d31a0ee/rendered_15.jpg?fit=fill&w=600&h=338",
        message: "Hello, i can understand this session as well",
        name: "Youssef Hamed",
      ),
      UserChat(
        image:
            "https://images.ctfassets.net/hrltx12pl8hq/3KWcqxPlvmgkpMS5VdjLAk/3cbdd812faf4b8c343b259656d31a0ee/rendered_15.jpg?fit=fill&w=600&h=338",
        message: "Hello, i can understand this session as well",
        name: "Eslam Fawzy",
      ),
      UserChat(
        image:
            "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
        message: "From Abanoub to Eslam",
        name: "Eslam Fareed",
      ),
      UserChat(
        image:
            "https://images.unsplash.com/photo-1581456495146-65a71b2c8e52?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
        message: "Hello, i can understand this session as well",
        name: "Abanoub George",
      ),
      UserChat(
        image:
            "https://images.ctfassets.net/hrltx12pl8hq/3KWcqxPlvmgkpMS5VdjLAk/3cbdd812faf4b8c343b259656d31a0ee/rendered_15.jpg?fit=fill&w=600&h=338",
        message: "Rania could do it be herself",
        name: "Rania",
      ),
      UserChat(
        image:
            "https://images.ctfassets.net/hrltx12pl8hq/3KWcqxPlvmgkpMS5VdjLAk/3cbdd812faf4b8c343b259656d31a0ee/rendered_15.jpg?fit=fill&w=600&h=338",
        message: "Hello, i can understand this session as well",
        name: "Youssef Hamed",
      ),
      UserChat(
        image:
            "https://images.ctfassets.net/hrltx12pl8hq/3KWcqxPlvmgkpMS5VdjLAk/3cbdd812faf4b8c343b259656d31a0ee/rendered_15.jpg?fit=fill&w=600&h=338",
        message: "Hello, i can understand this session as well",
        name: "Eslam Fawzy",
      ),
    ]);

    Future ft = Future(() {});
    for (var item in chats) {
      ft = ft.then(
        (value) => Future.delayed(
          const Duration(milliseconds: 500),
        ).then((value) {
          chatsTiles.add(_buildItem(item));
          _key.currentState!.insertItem(chatsTiles.length - 1);
        }),
      );
    }
  }

  final Tween<Offset> _offset =
      Tween(begin: const Offset(-1, 0), end: const Offset(0, 0));
  final Tween<double> _fade = Tween(begin: 0, end: 1);

  final Tween<double> _fade2 = Tween(begin: 0, end: 1);
  final Tween<double> _size = Tween(begin: 0, end: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Animation"),
      ),
      body: AnimatedList(
        key: _key,
        initialItemCount: chatsTiles.length,
        itemBuilder: (context, index, animation) {
          return index % 2 == 0
              ? ScaleTransition(
                  scale: animation.drive(_fade),
                  child: SlideTransition(
                    position: animation.drive(_offset),
                    child: chatsTiles[index],
                  ),
                )
              : SizeTransition(
                  sizeFactor: animation.drive(_fade2),
                  child: FadeTransition(
                    opacity: animation.drive(_size),
                    child: chatsTiles[index],
                  ),
                );
        },
      ),
    );
  }

  Widget _buildItem(UserChat chat) {
    return Card(
      child: ListTile(
        subtitle: Text(chat.message!),
        title: Text(chat.name!),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(chat.image!),
        ),
      ),
    );
  }
}

class UserChat {
  String? image;
  String? name;
  String? message;

  UserChat({this.image, this.message, this.name});
}
