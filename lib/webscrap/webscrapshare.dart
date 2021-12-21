import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';

class WebScrapShareSansar extends StatefulWidget {
  const WebScrapShareSansar({Key? key}) : super(key: key);

  @override
  _WebScrapShareSansarState createState() => _WebScrapShareSansarState();
}

class _WebScrapShareSansarState extends State<WebScrapShareSansar> {
  List<String> title = [];
  List<String?> img = [];
  List<String> time = [];
  List<String?> link = [];

  void _getDataFromWeb() async {
    final response = await http
        .get(Uri.parse("https://www.sharesansar.com/category/latest"));
    final body = response.body;

    final html = parse(body);

    final element =
        html.getElementsByClassName("col-md-10 col-sm-10 col-xs-12");
    final image =
        html.getElementsByClassName("col-md-2 col-sm-2 col-xs-3 hidden-xs");
    final date = html.getElementsByClassName("col-md-10 col-sm-10 col-xs-12");
    final link2 = html.getElementsByClassName("col-md-10 col-sm-10 col-xs-12");

    setState(() {
      title = element
          .map((e) => e.getElementsByTagName("h4")[0].innerHtml)
          .toList();
      img = image
          .map((e) => e.getElementsByTagName("img")[0].attributes['src'])
          .toList();
      time =
          date.map((e) => e.getElementsByTagName("span")[0].innerHtml).toList();
      link = link2
          .map((e) => e.getElementsByTagName("a")[0].attributes['href'])
          .toList();
    });
    var name;
    for (name in time) {
      debugPrint(name);
    }
  }

  @override
  void initState() {
    _getDataFromWeb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: title.isEmpty
            ? const Text(
                "No Data",
                style: TextStyle(color: Colors.white, fontSize: 30),
              )
            : ListView.builder(
                itemCount: title.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: GestureDetector(
                          onTap: () async {
                            dynamic url = link[index];
                            if (await canLaunch(url)) {
                              launch(url);
                            } else {
                              // ignore: avoid_print
                              print('error');
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    Image.network(img[index]!),
                                    Text(time[index]),
                                    const SizedBox(height: 15),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        title[index],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    // const SizedBox(height: 15),

                                    // const SizedBox(height: 15),
                                    // Text(time[index]),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ));
  }
}
