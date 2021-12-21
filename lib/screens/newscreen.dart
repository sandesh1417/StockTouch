import 'package:flutter/material.dart';
import 'package:stockapp/webscrap/webscrap.dart';
import 'package:stockapp/webscrap/webscrapshare.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Mero Lagani'),
    Tab(text: 'Share Sansar'),
    Tab(text: 'Nepali Paisa'),
  ];
  late TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(
      length: myTabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("News"),
        bottom: TabBar(
          controller: _tabcontroller,
          indicatorColor: Colors.white,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(controller: _tabcontroller, children: const [
        WebScraping(),
        WebScrapShareSansar(),
        Center(
          child: Text(
            "Nepali Paisa",
            style: TextStyle(color: Colors.white, fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }
}
