import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_search_app/data/models/artist.dart';
import 'package:music_search_app/data/models/song.dart';

final songsProvider = ChangeNotifierProvider((ref) => SongsProvider(ref.read));

class SongsProvider extends ChangeNotifier {
  final Reader _reader;

  bool _loading = false;

  final List<String> _songsList = [];
  final List<String> _artistsList = [];

  final Map<String, Song> _songsMap = {};
  final Map<String, Artist> _artistsMap = {};

  List<String> get songsList => _songsList;

  List<String> get artistsList => _artistsList;

  Map<String, Song> get songsMap => _songsMap;

  Map<String, Artist> get artistsMap => _artistsMap;

  bool get loading => _loading;

  set loading(val) {
    _loading = val;
    notifyListeners();
  }

  SongsProvider(this._reader);

  Future<void> initializeSongsData() async {
    print("INITIALIZING START");
    loading = true;
    await getSongs();
    await getArtists();
    loading = false;
    print("INITIALIZING DONE");
  }

  Future<void> getSongs() async {
    final String response =
        await rootBundle.loadString('assets/json/songs.json');
    final data = await json.decode(response);

    List<Song> songsList =
        data['songs'].map((e) => Song.fromJson(e)).toList().cast<Song>();

    for (Song song in songsList) {
      _songsList.add(song.id);
      _songsMap[song.id] = song;

      for (Artist artist in song.artists) {
        _artistsMap[artist.id] = artist;
      }
    }

    notifyListeners();
  }

  Future<void> getArtists() async {
    final String response =
        await rootBundle.loadString('assets/json/artists.json');
    final data = await json.decode(response);

    List<Artist> artistsList =
        data['artists'].map((e) => Artist.fromJson(e)).toList().cast<Artist>();

    for (Artist artist in artistsList) {
      _artistsList.add(artist.id);
      _artistsMap[artist.id] = artist;
    }
    notifyListeners();
  }
}
