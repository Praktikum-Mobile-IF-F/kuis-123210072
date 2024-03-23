import 'package:flutter/material.dart';
import 'package:kuis072/models/top_album.dart';
import 'package:kuis072/screens/detail_screen.dart';
import 'package:kuis072/screens/login_page.dart';
import 'package:kuis072/widgets/item.dart';

class TopAlbumPage extends StatelessWidget {
  const TopAlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.grey,
        title: const Text('Top Album'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(
                Icons.logout,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              }
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return MyItem(
              topAlbum: topAlbumList[index],
            );
          },
          itemCount: topAlbumList.length,
        ),
      ),
    );
  }
}
