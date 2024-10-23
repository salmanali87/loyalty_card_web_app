import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ManageCards extends StatefulWidget {
  const ManageCards({super.key});

  @override
  State<ManageCards> createState() => _ManageCardsState();
}

class _ManageCardsState extends State<ManageCards> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Row(),
          //
          // All Cards Showcase
          //
          Row(
            children: [
              Card(
                child: GestureDetector(
                  onTap: (){
                    
                  },
                  child: Container(
                    width: 200,
                    height: 250,
                  
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 50,
                        ),
                        Text("Create New Card"),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
