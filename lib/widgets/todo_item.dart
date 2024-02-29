import 'package:flutter/material.dart';
import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteIteml;
  const ToDoItem({Key? key, required this.todo, required this.onToDoChanged, required this.onDeleteIteml}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone? Icons.check_box:Icons.check_box_outline_blank,
          color: todo.isDone? Colors.lightBlue : Color.fromARGB(255, 49, 49, 49),
        ),
        title: Text(
          todo.todoText!, 
          style: TextStyle(
            fontSize: 16, 
            color: Colors.black, 
            decoration: todo.isDone? TextDecoration.lineThrough:null
          ), 
          textAlign: TextAlign.center,
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 193, 26, 14),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
           color: Colors.white, 
           iconSize: 18,
           icon: Icon(
            Icons.delete,
           ),
           onPressed: () {
            onDeleteIteml(todo.id);
           },
          ),
        ),
      ),
    );
  }
}