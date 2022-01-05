import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:music_search_app/data/models/app_user.dart';
import 'package:music_search_app/data/models/artist.dart';
import 'package:music_search_app/data/models/song.dart';
import 'package:music_search_app/presentation/providers/auth_service.dart';
import 'package:music_search_app/presentation/providers/database_service.dart';

final songsProvider = ChangeNotifierProvider((ref) => SongsProvider(ref.read));

class SongsProvider extends ChangeNotifier {
  final Reader _reader;

  bool _loading = false;

  final List<String> _songsList = [];
  List<String> _favSongsList = [];
  final List<String> _artistsList = [];

  final Map<String, Song> _songsMap = {};
  final Map<String, Artist> _artistsMap = {};

  List<String> get songsList => _songsList;

  List<String> get favSongsList => _favSongsList;

  List<String> get artistsList => _artistsList;

  Map<String, Song> get songsMap => _songsMap;

  Map<String, Artist> get artistsMap => _artistsMap;

  bool get loading => _loading;

  set loading(val) {
    _loading = val;
    notifyListeners();
  }

  set favSongsList(val) {
    _favSongsList = val;
    notifyListeners();
  }

  SongsProvider(this._reader);

  Future<void> initializeSongsData() async {
    loading = true;
    await getSongs();
    await getArtists();
    loading = false;
  }

  Future<void> getSongs() async {
    final String response =
        await rootBundle.loadString('assets/json/songs.json');
    final data = await json.decode(response);

    List<Song> songsList =
        data['songs'].map((e) => Song.fromJson(e)).toList().cast<Song>();

    for (Song song in songsList) {
      _songsList.add(song.id);

      if (_favSongsList.contains(song.id)) {
        Song newSong = song.copyWith(true);
        _songsMap[song.id] = newSong;
      } else {
        _songsMap[song.id] = song;
      }

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

  Future<void> addSongToFavorites(String id) async {
    await _toggleFavorite(id, true);
  }

  Future<void> removeSongFromFavorites(String id) async {
    await _toggleFavorite(id, false);
  }

  Future<void> _toggleFavorite(String id, bool isFavorited) async {
    AppUser user = _reader(authService).currentUser!;
    Song song = _songsMap[id]!;

    if (isFavorited) {
      _favSongsList.add(id);
      Song newSong = song.copyWith(isFavorited);
      _songsMap[id] = newSong;
      notifyListeners();
      Fluttertoast.showToast(msg: 'Added to favorites');

      // Update user data
      user.favoriteList.add(id);
      await _reader(databaseService).updateUser(user);
    } else {
      _favSongsList.remove(id);
      Song newSong = song.copyWith(isFavorited);
      _songsMap[id] = newSong;
      notifyListeners();
      Fluttertoast.showToast(msg: 'Removed from favorites');

      // Update user data
      user.favoriteList.remove(id);
      await _reader(databaseService).updateUser(user);
    }
  }
}
