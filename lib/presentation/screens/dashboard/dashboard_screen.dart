import 'package:flutter/material.dart';
import 'package:music_search_app/core/constants/color_constants.dart';
import 'package:music_search_app/data/models/artist.dart';
import 'package:music_search_app/data/models/song.dart';
import 'package:music_search_app/presentation/shared_widgets/custom_app_bar.dart';
import 'package:music_search_app/presentation/shared_widgets/song/song_cover_widget.dart';
import 'package:music_search_app/presentation/shared_widgets/song/song_list_tile.dart';

List<Song> songsList = [
  Song(
    id: '1',
    title: 'Starboy',
    artist: artist,
    thumbnailUrl:
        'https://images-na.ssl-images-amazon.com/images/I/814htMhuuML._SL1400_.jpg',
    webPageUrl: 'https://en.wikipedia.org/wiki/Drake_(musician)',
    isFavorited: false,
  ),
  Song(
    id: '2',
    title: 'Starboy',
    artist: artist,
    thumbnailUrl:
        'https://images-na.ssl-images-amazon.com/images/I/814htMhuuML._SL1400_.jpg',
    webPageUrl: 'https://en.wikipedia.org/wiki/Drake_(musician)',
    isFavorited: true,
  ),
  Song(
    id: '3',
    title: 'Starboy',
    artist: artist,
    thumbnailUrl:
        'https://images-na.ssl-images-amazon.com/images/I/814htMhuuML._SL1400_.jpg',
    webPageUrl: 'https://en.wikipedia.org/wiki/Drake_(musician)',
    isFavorited: false,
  )
];

Artist artist = Artist(id: '1', name: 'Drake');

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Dashboard',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Welcome ${widget.username}!',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: AppColors.lightPurple),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Trending',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: Builder(
                builder: (ctx) {
                  List<Widget> widgets = [];

                  for (int i = 0; i < songsList.length; i++) {
                    final Widget widget = Padding(
                      padding: EdgeInsets.only(
                          left: (i == 0) ? 20.0 : 0.0, right: 20.0),
                      child: SongCoverWidget(
                        song: songsList[i],
                      ),
                    );

                    widgets.add(widget);
                  }

                  return ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [...widgets],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Favorites',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(height: 20),
            Builder(builder: (context) {
              List<Widget> widgets = [];

              for (int i = 0; i < songsList.length; i++) {
                final Widget widget = Padding(
                  padding: const EdgeInsets.only(top: 0.0, bottom: 20.0),
                  child: SongListTile(song: songsList[i]),
                );

                widgets.add(widget);
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [...widgets],
              );
            }),
          ],
        ),
      ),
    );
  }
}
