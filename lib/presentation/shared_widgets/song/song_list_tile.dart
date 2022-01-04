import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_search_app/core/constants/color_constants.dart';
import 'package:music_search_app/data/models/song.dart';
import 'package:music_search_app/presentation/providers/songs_provider.dart';

class SongListTile extends ConsumerWidget {
  const SongListTile({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, ref) {
    Song song = ref.watch(songsProvider).songsMap[id]!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.network(
                    song.thumbnailUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Starboy',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      'Drake',
                      style: Theme.of(context).textTheme.bodyText2,
                    )
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                song.isFavorited ? Icons.favorite : Icons.favorite_outline,
                color: AppColors.lightPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
