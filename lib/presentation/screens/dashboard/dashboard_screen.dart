import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_search_app/core/constants/color_constants.dart';
import 'package:music_search_app/presentation/providers/songs_provider.dart';
import 'package:music_search_app/presentation/shared_widgets/custom_app_bar.dart';
import 'package:music_search_app/presentation/shared_widgets/song/song_cover_widget.dart';
import 'package:music_search_app/presentation/shared_widgets/song/song_list_tile.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(songsProvider).initializeSongsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Dashboard',
      ),
      body: Builder(
        builder: (context) {
          bool loading = ref.watch(songsProvider).loading;
          List<String> songsList = ref.watch(songsProvider).songsList;
          Map<String, dynamic> songsMap = ref.watch(songsProvider).songsMap;

          if (!loading) {
            return SingleChildScrollView(
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
                          .copyWith(color: AppColors.darkPink),
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
                              id: songsList[i],
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
                        child: SongListTile(id: songsList[i]),
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
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
