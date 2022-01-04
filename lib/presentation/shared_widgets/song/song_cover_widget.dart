import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_search_app/core/constants/color_constants.dart';
import 'package:music_search_app/data/models/song.dart';
import 'package:music_search_app/presentation/providers/songs_provider.dart';

class SongCoverWidget extends ConsumerWidget {
  const SongCoverWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, ref) {
    Song song = ref.watch(songsProvider).songsMap[id]!;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/song',
          arguments: {'id': id},
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 200,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.1),
                blurRadius: 6.0,
                offset: const Offset(3.0, 3.0),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 170,
                width: 150,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    song.thumbnailUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    song.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: AppColors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
