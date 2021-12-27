import 'package:flutter/material.dart';
import 'package:music_search_app/presentation/shared_widgets/custom_app_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key, required this.uid}) : super(key: key);

  final String uid;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Dashboard',
      ),
      body: Center(
        child: Text(widget.uid),
      ),
    );
  }
}
