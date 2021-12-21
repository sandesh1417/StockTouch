import 'package:flutter/material.dart';
import 'package:stockapp/webscrap/announcescrap.dart';

class Announcement extends StatefulWidget {
  const Announcement({Key? key}) : super(key: key);

  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Announcement"),
      ),
      body: const AnnounceWebScrap(),
    );
  }
}
