import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_search_app/presentation/providers/auth_service.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, ref) {
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/img/app_logo.png',
            height: 30,
          ),
          const SizedBox(width: 10.0),
          Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {
              ref.read(authService).signOut();
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).primaryColor,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
