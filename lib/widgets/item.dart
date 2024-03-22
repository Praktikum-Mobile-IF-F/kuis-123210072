import 'package:flutter/material.dart';
import 'package:kuis072/models/top_album.dart';
import 'package:kuis072/screens/detail_screen.dart';

class MyItem extends StatelessWidget {
  final TopAlbum topAlbum;

  const MyItem({
    super.key,
    required this.topAlbum,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(topAlbum: topAlbum),
          ),
        );
      },
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  color: Colors.grey,
                  child: Image.network(
                    topAlbum.imageUrls,
                    fit: BoxFit.cover
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
