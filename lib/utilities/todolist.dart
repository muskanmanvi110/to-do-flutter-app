import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class Todotile extends StatelessWidget {
  String taskname;
  final bool taskcompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletefuntion;
  Todotile({super.key,
  required this.taskname,
  required this.taskcompleted, 
  required this.onChanged,
  required this.deletefuntion});
 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:12,right:12,top:20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deletefuntion,
              icon: Icons.delete,
              backgroundColor: Colors.red,)
          ]),
        child: Container(
          decoration: BoxDecoration(color: Colors.pink[300],
          borderRadius: BorderRadius.circular(10)),
          height: 100,
          child: Row(
            children: [
              // checkbox
              Checkbox(value: taskcompleted, onChanged: onChanged),
              // text to be displayed
              Text(taskname,
              style: TextStyle(color: Colors.white,fontSize: 20,
              decoration:taskcompleted? TextDecoration.lineThrough: TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}