import 'package:flutter/material.dart';
import 'package:stockapp/screens/announcement.dart';
import 'package:stockapp/screens/newscreen.dart';
import 'package:stockapp/utilities/const.dart';
import 'package:stockapp/webscrap/webscrap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("DashBoard"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            //   UserAccountsDrawerHeader(
            //       accountName: Text("SampleName"),
            //       accountEmail: Text("SampleEmail@gmail.com"))
            // ],
            SizedBox(
                height: 30,
                child: Container(
                  color: Colors.black,
                )),
            const InkWell(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.tealAccent,
                  child: Icon(Icons.person_outline_rounded),
                ),
                title: Text(
                  "Sign In / Sign Up",
                  style: kHomeTextStyle,
                ),
              ),
            ),
            CustomSizedBox("LIVE MARKETS"),
            ListBuilder(const Icon(Icons.home_filled, color: Colors.blueGrey),
                "Dashboard", () {}),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            ListBuilder(
                const Icon(Icons.insert_chart_outlined_outlined,
                    color: Colors.tealAccent),
                "Market",
                () {}),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            ListBuilder(
                const Icon(Icons.account_balance_outlined,
                    color: Colors.tealAccent),
                "Portfolio",
                () {}),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            ListBuilder(
                const Icon(Icons.table_chart_outlined,
                    color: Colors.tealAccent),
                "FloorSheet",
                () {}),
            CustomSizedBox("CONTENT"),
            ListBuilder(
                const Icon(Icons.perm_device_information,
                    color: Colors.tealAccent),
                "News", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NewsScreen()));
            }),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),

            ListBuilder(
                const Icon(Icons.surround_sound_outlined,
                    color: Colors.tealAccent),
                "Announcement", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Announcement()));
            }),
            CustomSizedBox("TOOLS"),
            ListBuilder(
                const Icon(Icons.calculate_outlined, color: Colors.tealAccent),
                "Calculator",
                () {}),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            ListBuilder(
                const Icon(Icons.bar_chart_outlined, color: Colors.tealAccent),
                "Chart",
                () {}),

            CustomSizedBox("MORE"),
            ListBuilder(
                const Icon(Icons.redeem_sharp, color: Colors.tealAccent),
                "Ipo result",
                () {}),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            ListBuilder(
                const Icon(Icons.settings_applications_outlined,
                    color: Colors.tealAccent),
                "Settings",
                () {}),
          ],
        ),
      ),
      body: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: List.generate(choices.length, (index) {
                  return Container(
                    margin: EdgeInsets.all(7),
                    child: SelectCard(choice: choices[index], key: null,),
                  );
                }
                )
            ),
    );
  }
}

class Choice {
  const Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'News', icon: Icons.email),
  Choice(title: 'Market', icon: Icons.show_chart),
  Choice(title: 'Today Price', icon: Icons.signal_cellular_0_bar),
  Choice(title: 'Porfolio', icon: Icons.chat_rounded),
  Choice(title: 'Calculator', icon: Icons.smartphone_outlined),
  Choice(title: 'Letter', icon: Icons.new_label_sharp),
  Choice(title: 'Data', icon: Icons.data_usage),
  Choice(title: 'Sms Alert', icon: Icons.alarm),
  Choice(title: 'New Share', icon: Icons.new_releases),
  Choice(title: 'Offers', icon: Icons.wallet_giftcard),
];

class SelectCard extends StatelessWidget {
  const SelectCard({ key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color(0xFF424251),
        child:  InkWell(
          child: Center(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Icon(choice.icon, size:50.0)),
                Text(choice.title, style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10,)
              ]
          ),
          ),
          onTap: () {
            debugPrint('clicked : ${choice.title}');
          },
        )
    );
  }
}

class ListBuilder extends StatelessWidget {
  ListBuilder(this.listIcon, this.listName, this.onClick, {Key? key})
      : super(key: key);
  Icon listIcon;
  String listName;
  VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: ListTile(
        leading: listIcon,
        title: Text(
          listName,
          style: kHomeTextStyle,
        ),
      ),
    );
  }
}

class CustomSizedBox extends StatelessWidget {
  CustomSizedBox(this.mainHeading, {Key? key}) : super(key: key);
  String mainHeading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30,
        child: Container(
          alignment: Alignment.topLeft,
          color: Colors.black,
          child: Text(
            mainHeading,
            style: kHeadingTextStyle,
          ),
        ));
  }
}
