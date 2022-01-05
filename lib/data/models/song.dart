import 'package:music_search_app/data/models/artist.dart';

class Song {
  final String id;
  final String title;
  final List<Artist> artists;
  final String thumbnailUrl;
  final bool isFavorited;

  Song({
    required this.id,
    required this.title,
    required this.artists,
    required this.thumbnailUrl,
    required this.isFavorited,
  });

  Song copyWith(bool newIsFavorited) {
    return Song(
      id: id,
      title: title,
      artists: artists,
      thumbnailUrl: thumbnailUrl,
      isFavorited: newIsFavorited,
    );
  }

  factory Song.fromJson(Map<String, dynamic> map) {
    String id = map['id'];
    String title = map['title'];
    List<Artist> artists = map['artists']
        .map((e) => Artist.fromJson(e))
        .toList()
        .cast<Artist>()
        .toList();
    String thumbnailUrl = map['thumbnailUrl'];
    bool isFavorited = map['isFavorited'];

    return Song(
      id: id,
      title: title,
      artists: artists,
      thumbnailUrl: thumbnailUrl,
      isFavorited: isFavorited,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['id'] = id;
    data['title'] = title;
    data['artists'] = artists.map((e) => e.toJson()).toList();
    data['isFavorited'] = isFavorited;

    return data;
  }
}
