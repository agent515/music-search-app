import 'package:music_search_app/data/models/artist.dart';

class Song {
  final String id;
  final String title;
  final List<Artist> artists;
  final String thumbnailUrl;
  final bool isFavorited;
  final String webPageUrl;

  Song({
    required this.id,
    required this.title,
    required this.artists,
    required this.thumbnailUrl,
    required this.isFavorited,
    required this.webPageUrl,
  });

  factory Song.fromJson(Map<String, dynamic> map) {
    print(map);
    String id = map['id'];
    String title = map['title'];
    List<Artist> artists = map['artists']
        .map((e) => Artist.fromJson(e))
        .toList()
        .cast<Artist>()
        .toList();
    String thumbnailUrl = map['thumbnailUrl'];
    bool isFavorited = map['isFavorited'];
    String webPageUrl = map['webPageUrl'];

    return Song(
      id: id,
      title: title,
      artists: artists,
      thumbnailUrl: thumbnailUrl,
      isFavorited: isFavorited,
      webPageUrl: webPageUrl,
    );
  }
}
