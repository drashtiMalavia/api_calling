import 'package:api_calling/TodoModel.dart';
import 'package:flutter/material.dart';

class DisplayTodo extends StatefulWidget {
  List<TodoModel> myList;
  DisplayTodo(this.myList, {super.key});

  @override
  State<DisplayTodo> createState() => _DisplayTodoState();
}

class _DisplayTodoState extends State<DisplayTodo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('To Do List',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          backgroundColor: Colors.black,
        ),
        body:
        Column(
          children: [
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  color: Colors.grey,
                  child: Text('id',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                Container(
                  height: 100,
                  alignment: Alignment.center,
                  width: 100,
                  color: Colors.grey,
                  child: Text('user_id',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey,
                  alignment: Alignment.center,
                  child: Text('title',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                Container(
                  height: 100,
                  width: 123,
                  color: Colors.grey,
                  alignment: Alignment.center,
                  child: Text('completed',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: widget.myList.length,
                  itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        color: Color.fromRGBO(255, 234, 151, 100),
                        child: Text('${widget.myList[index].id}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        height: 100,
                        alignment: Alignment.center,
                        width: 100,
                        color: Color.fromRGBO(255, 234, 151, 100),
                        child: Text('${widget.myList[index].userId}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        color: Color.fromRGBO(255, 234, 151, 100),
                        child: Text('${widget.myList[index].title}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        height: 100,
                        width: 123,
                        alignment: Alignment.center,
                        color: Color.fromRGBO(255, 234, 151, 100),
                        child: Text('${widget.myList[index].completed}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
