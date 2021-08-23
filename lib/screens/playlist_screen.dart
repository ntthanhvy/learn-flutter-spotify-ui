import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/widgets/widget.dart';

class PLaylistScreen extends StatefulWidget {
  final Playlist playlist;

  const PLaylistScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  _PLaylistScreenState createState() => _PLaylistScreenState();
}

class _PLaylistScreenState extends State<PLaylistScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: const Icon(Icons.chevron_left, size: 20.0),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: const Icon(Icons.chevron_right, size: 20.0),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(
                  primary: Theme.of(context).iconTheme.color),
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle_outlined,
                size: 30.0,
              ),
              label: const Text("Thanh Vy")),
          const SizedBox(
            width: 8.0,
          ),
          IconButton(
              padding: const EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_down)),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFAF1018),
            Theme.of(context).backgroundColor,
          ],
          stops: const [0, 0.3],
        )),
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            children: [
              PlaylistHeader(playlist: widget.playlist),
              TracksList(tracks: widget.playlist.songs)
            ],
          ),
        ),
      ),
    );
  }
}
