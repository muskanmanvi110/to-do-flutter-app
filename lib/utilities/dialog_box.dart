// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/button.dart';

class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback Onsaved;
  VoidCallback Oncanceled;
  DialogBox({super.key, 
  required this.controller,
  required this.Onsaved,
  required this.Oncanceled});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
     shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      content: Container(
        height:180,
        child: Column(
        children: [
          TextField(
            controller: controller,
            decoration:const  InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Add Task"
            )
            ),
          const SizedBox(height:17),
          Button(text:"Save", onPressed:(){Onsaved();}),
          const SizedBox(height:10),
          Button(text:"Cancel", onPressed:(){Oncanceled();}),
        ],
      ),)
      
    );
  }
}