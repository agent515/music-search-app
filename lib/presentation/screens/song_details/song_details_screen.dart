import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_search_app/core/constants/color_constants.dart';
import 'package:music_search_app/data/models/artist.dart';
import 'package:music_search_app/data/models/song.dart';
import 'package:music_search_app/presentation/providers/songs_provider.dart';

class SongDetailsScreen extends StatefulWidget {
  const SongDetailsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  _SongDetailsScreenState createState() => _SongDetailsScreenState();
}

class _SongDetailsScreenState extends State<SongDetailsScreen> {
  Widget _buildArtists(List<Artist> artists) {
    List<Widget> widgets = [];

    for (int i = 0; i <= 3 && i < artists.length; i++) {
      Widget widget = Padding(
        padding: EdgeInsets.only(right: (i == artists.length - 1) ? 0.0 : 8.0),
        child: Text(
          artists[i].name,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: AppColors.white,
                decoration: TextDecoration.underline,
              ),
        ),
      );
      widgets.add(widget);
    }
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [...widgets],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        Song song = ref.watch(songsProvider).songsMap[widget.id]!;

        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: size.height,
                    width: size.width,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Positioned.fill(
                          child: Image.network(
                            song.thumbnailUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: size.height * 0.7,
                          width: size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                AppColors.black.withOpacity(0.7),
                                AppColors.black,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                height: size.height * 0.3,
                              ),
                              Text(
                                song.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(color: AppColors.white),
                              ),
                              const SizedBox(height: 20),
                              _buildArtists(song.artists),
                              const SizedBox(height: 30),
                              Icon(
                                song.isFavorited
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: AppColors.darkPink,
                                size: 50,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SafeArea(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
