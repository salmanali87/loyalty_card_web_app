import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loyalty_card_web_app/src/manage_cards/ui/create_update_card.dart';
import 'package:loyalty_card_web_app/src/manage_cards/ui/manage_cards.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Widget> navItems = [];

  bool sideBarSmall = false;

  bool mobile = false;
  @override
  Widget build(BuildContext context) {
    mobile = MediaQuery.of(context).size.width > 700 ? false : true;
    return Scaffold(
      appBar: AppBar(
        title: const Text("DashBoard"),
        actions: mobile ? null : navItems,
        backgroundColor: Colors.grey[100],
        scrolledUnderElevation: 0.0,
      ),
      drawer: mobile
          ? Drawer(
              child: ListView(
                children: navItems,
              ),
            )
          : null,
      body: Row(
        children: [
          if (mobile)
            const SizedBox()
          else
            Container(
              width: sideBarSmall ? 60 : 250,
              color: Colors.grey[100],
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 5),
                        child: Row(
                          children: [
                            const Icon(Icons.card_membership, size: 20),
                            sideBarSmall
                                ? const SizedBox()
                                : const Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text("Manage Card"),
                                  ),
                          ],
                        ),
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          sideBarSmall = !sideBarSmall;
                        });
                      },
                      icon: const Icon(Icons.arrow_left, size: 30)),
                ],
              ),
            ),
          Expanded(
            flex: 8,
            child: Container(child: const CreateUpdateCard()),
          ),
        ],
      ),
    );
  }
}
