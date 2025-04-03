import 'dart:convert';
import 'dart:ui';

import 'package:api_calling/DisplayProduct.dart';
import 'package:api_calling/PostModel.dart';
import 'package:api_calling/ProductModel.dart';
import 'package:api_calling/TodoModel.dart';
import 'package:api_calling/UserModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';



import 'package:http/http.dart' as http;

import 'DisplayPost.dart';
import 'DisplayTodo.dart';
import 'DisplayUser.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  Map<String,dynamic> map={};
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset('image/img.png',fit: BoxFit.cover,),
            ),
            Column(
              children: [
                Container(
                  height: 50,
                  width: 150,
                  margin: EdgeInsets.only(left: 150,top: 300),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                      onPressed: () async {
                        var baseurl=await Uri.parse('https://jsonplaceholder.typicode.com/posts');
                        var response=await http.get(baseurl);
                        print('Responce=${response.body}');
                        List myPost=jsonDecode(response.body);
                        print('mypost=${myPost[2]['id']}');
                        List<PostModel> myList=myPost.map((json)=>PostModel.fromJson((json))).toList();
                        print('data=${myList[0].body}');
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return DisplayPost(myList);
                        },));
                  }, child: Text('Post',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
                Container(
                  height: 50,
                  width: 150,
                  margin: EdgeInsets.only(left: 150,top: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                      onPressed: () async {
                        var baseurl=await Uri.parse('https://jsonplaceholder.typicode.com/users');
                        var response=await http.get(baseurl);
                        // print('Responce=${response.body}');
                        List myUser=jsonDecode(response.body);
                        // print('mypost=${myUser[2]['id']}');
                        List<UserModel> myList=myUser.map((json)=>UserModel.fromJson((json))).toList();
                        // print('data=${myList[0].email}');
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return DisplayUser(myList);
                        },));
                      }, child: Text('User',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold))),
                ),
                Container(
                  height: 50,
                  width: 150,
                  margin: EdgeInsets.only(left: 150,top: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                      onPressed: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Displayproduct();
                        },));
                      }, child: Text('Product',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold))),
                ),
                Container(
                  height: 50,
                  width: 150,
                  margin: EdgeInsets.only(left: 150,top: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                      onPressed: () async {
                        var baseurl=await Uri.parse('https://jsonplaceholder.typicode.com/todos');
                        var response=await http.get(baseurl);
                        print('Responce=${response.body}');
                        List Todo=jsonDecode(response.body);
                        print('mypost=${Todo[2]['id']}');
                        List<TodoModel> myList=Todo.map((json)=>TodoModel.fromJson((json))).toList();
                        print('data=${myList[0].completed}');
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return DisplayTodo(myList);
                        },));
                      }, child: Text('To do',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold))),
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}
