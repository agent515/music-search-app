import 'package:music_search_app/data/models/artist.dart';

class Song {
  final String id;
  final String title;
  final Artist artist;
  final String thumbnailUrl;
  final bool isFavorited;
  final String webPageUrl;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.thumbnailUrl,
    required this.isFavorited,
    required this.webPageUrl,
  });
}
