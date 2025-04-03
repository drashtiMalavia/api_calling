import 'package:api_calling/UserModel.dart';
import 'package:flutter/material.dart';

class DisplayId extends StatefulWidget {
  List<UserModel> myList;
  int index;
  DisplayId(this.myList, this.index, {super.key});

  @override
  State<DisplayId> createState() => _DisplayIdState();
}

class _DisplayIdState extends State<DisplayId> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Data'),
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Container(

            margin: EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.white,width: 2),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                Container(
                    child: Icon(Icons.account_circle,size: 100,color: Colors.white,)
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 3),
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.lime,
                  ),
                  child: Text("id :  ${widget.myList[widget.index].id}",style: TextStyle(color: Colors.black87,fontSize: 20),),
                ),
                Container(
                  // height: 50,
                  // width: 150,
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 3),
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.lime,
                  ),
                  child: Text("name :  ${widget.myList[widget.index].name}",style: TextStyle(color: Colors.black87,fontSize: 20),),
                ),
                Container(
                  // height: 50,
                  // width: 150,
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 3),
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.lime,
                  ),
                  child: Text("User Name :  ${widget.myList[widget.index].username}",style: TextStyle(color: Colors.black87,fontSize: 20),),
                ),
                Container(
                  // height: 50,
                  // width: 150,
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 3),
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.lime,
                  ),
                  child: Text("Email :  ${widget.myList[widget.index].email}",style: TextStyle(color: Colors.black87,fontSize: 20),),
                ),
                Container(
                  // height: 50,
                  // width: 150,
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 3),
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.lime,
                  ),
                  child: Text("Phone :  ${widget.myList[widget.index].phone}",style: TextStyle(color: Colors.black87,fontSize: 20),),
                ),
                Container(
                  // height: 50,
                  // width: 150,
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 3),
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.lime,
                  ),
                  child: Text("Address : \n\t ${widget.myList[widget.index].address!.street} , ${widget.myList[widget.index].address!.suite} , ${widget.myList[widget.index].address!.city}, ${widget.myList[widget.index].address!.zipcode} ,  ${widget.myList[widget.index].address!.geo!.lat} ,  ${widget.myList[widget.index].address!.geo!.lng}" ,style: TextStyle(color: Colors.black87,fontSize: 20),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 3),
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.lime,
                  ),
                  child: Text("Company : \n\t name: ${widget.myList[widget.index].company!.name} \n Catchphrase: ${widget.myList[widget.index].company!.catchPhrase} \n Bs: ${widget.myList[widget.index].company!.bs}",style: TextStyle(color: Colors.black87,fontSize: 20),),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
