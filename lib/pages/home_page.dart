// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/dialog_box.dart';
import 'package:flutter_application_1/utilities/todolist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
// Text controller
  final _controller = TextEditingController();


// List of to do tasks
  List todolist = [];

// function for checkbox
  void checkboxchanged(bool? value,int index){
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

// save new task function
  void saveNewTask(){
    setState(() {
      todolist.add([_controller.text,false]);
    _controller.clear();
    });
    Navigator.of(context).pop();
  }
// function for creating a new task
  void createtask(){
    showDialog(context: context, 
    builder: (builder){
      return DialogBox(
        controller: _controller,
        Onsaved: saveNewTask,
        Oncanceled: ()=>Navigator.of(context).pop(),
      );
    }
  );
  }

  // function for deleting a task a new task
  void deletetask(int index){
    setState(() {
      todolist.removeAt(index);
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        elevation: 10,
        title: const Text("TO  DO",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed:(){
          createtask();
        }
        ),
      body:
       ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (context, index){
          return Todotile(
            taskname: todolist[index][0],
            taskcompleted: todolist[index][1],
            onChanged:(value)=>checkboxchanged(value,index),
            deletefuntion: (context) => deletetask(index));
        } 
        ,
      ),
    );
  }
}