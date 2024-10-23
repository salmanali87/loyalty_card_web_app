import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:loyalty_card_web_app/src/manage_cards/ui/create_card_form.dart';

class CreateUpdateCard extends StatefulWidget {
  const CreateUpdateCard({super.key});

  @override
  State<CreateUpdateCard> createState() => _CreateUpdateCardState();
}

class _CreateUpdateCardState extends State<CreateUpdateCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 350,
          height: double.maxFinite,
          padding: const EdgeInsets.all(10),
          child: Card(
            elevation: 10,
            color: Colors.teal,
            child: Column(
              children: [
                const Padding(
                  padding:
                      EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.logo_dev,
                        size: 50,
                      ),
                      Text("Company Name")
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage("assets/images/head.jpg"),
                        colorFilter: ColorFilter.mode(
                            Colors.teal.withOpacity(0.5), BlendMode.dstATop),
                        fit: BoxFit.fill,
                      ),
                      color: Colors.white.withOpacity(0.9)),
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 30),
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return const Icon(
                        Icons.stacked_bar_chart,
                        size: 30,
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Stamps Until New Reward"),
                      Text("Rewards"),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("3"),
                      Text("5"),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    alignment: Alignment.bottomCenter,
                    child: const Icon(
                      Icons.qr_code,
                      size: 150,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  DottedBorder(
                      strokeWidth: 2,
                      color: Colors.blueGrey,
                      child: Container(
                        width: double.maxFinite,
                        height: 200,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.image,
                              size: 50,
                            ),
                            const SizedBox(height: 5),
                            const Text("Select Image"),
                            const SizedBox(height: 5),
                            ElevatedButton(
                                onPressed: () {}, child: const Text("browse")),
                            const SizedBox(height: 10),
                            const Text(
                              "Supported Image JPEG, JPG, PNG",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      )),

                      const SizedBox(height: 20,),
                  const TextField(
                      decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    hintText: 'Company Name',
                    labelText: 'Company Name',
                  )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
