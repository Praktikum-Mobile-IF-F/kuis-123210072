import 'package:flutter/material.dart';
import 'package:kuis072/models/top_album.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final TopAlbum topAlbum;

  const DetailPage({
    super.key,
    required this.topAlbum,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topAlbum.albumName),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _launchURL(widget.topAlbum.albumurl);
            },
            icon: const Icon(Icons.share),
            tooltip: 'Open Spotify in Browser',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: SizedBox(
                height: 300,
                child: Image.network(widget.topAlbum.imageUrls),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    widget.topAlbum.albumName,
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    widget.topAlbum.singer,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 30.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.calendar_month_outlined),
                          Expanded(
                            child: Text(
                              widget.topAlbum.firstEntryDate,
                              style: const TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Text(
                            "| ",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          const Icon(Icons.home_work_outlined),
                          Expanded(
                            child: Text(
                              widget.topAlbum.source,
                              style: const TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 40),
              child: Container(
                height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Song List",
                      style: TextStyle(
                          color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.topAlbum.songs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 40),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFF2EEF3FF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          widget.topAlbum.songs[index],
                          // style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchURL(String url) async{
  if(await canLaunchUrl(Uri.parse(url))){
    launchUrl(Uri.parse(url));
  }else {
    throw 'Error cannot launch $url';
  }
}