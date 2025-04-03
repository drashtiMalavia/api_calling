import 'package:api_calling/UserModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DisplayId.dart';

class DisplayUser extends StatefulWidget {
  List<UserModel> myList;
  DisplayUser(this.myList,{super.key});

  @override
  State<DisplayUser> createState() => _DisplayUserState();
}

class _DisplayUserState extends State<DisplayUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Information of Displaying Post',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset('image/img_1.png',fit: BoxFit.cover,),
            ),
            Container(
              child: ListView.builder(
                  itemCount: widget.myList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return DisplayId(widget.myList,index);
                        },));
                        setState(() {

                        });
                      },
                      child: Card(
                        elevation: 20,
                        child: Container(
                            child: Text('ID:${widget.myList[index].id}',style: TextStyle(fontSize: 20),),
                          alignment: Alignment.center,
                          color: Colors.black12,
                          padding: EdgeInsets.all(20),
                        ),
                      ),
                    );
                  },),
              // child: ListView.builder(
              //   itemCount: widget.myList.length,
              //   itemBuilder: (context, index) {
              //     return Container(
              //       height: 310,
              //       width: 200,
              //       child: Card(
              //         elevation: 20,
              //         child: Column(
              //           children: [
              //             Container(
              //               child: Text('id=${widget.myList[index].id}'),
              //             ),
              //             Container(
              //               child: Text('Email=${widget.myList[index].email}'),
              //             ),
              //             Container(
              //               child: Text('Phone=${widget.myList[index].phone}'),
              //             ),
              //             Container(
              //               child: Text('WebSite=${widget.myList[index].website}'),
              //             ),
              //             Container(
              //               child: Text('Name=${widget.myList[index].name}'),
              //             ),
              //             Container(
              //               child: Text('Username=${widget.myList[index].username}'),
              //             ),
              //             Container(
              //               child: Text('city=${widget.myList[index].address?.city}'),
              //             ),
              //             Container(
              //               child: Text('street=${widget.myList[index].address?.street}'),
              //             ),
              //             Container(
              //               child: Text('suite=${widget.myList[index].address?.suite}'),
              //             ),
              //             Container(
              //               child: Text('zipcode=${widget.myList[index].address?.zipcode}'),
              //             ),
              //             Container(
              //               child: Text('lat=${widget.myList[index].address?.geo?.lat}'),
              //             ),
              //             Container(
              //               child: Text('lng=${widget.myList[index].address?.geo?.lng}'),
              //             ),
              //             Container(
              //               child: Text('name=${widget.myList[index].company?.name}'),
              //             ),
              //             Container(
              //               child: Text('catchphrase=${widget.myList[index].company?.catchPhrase}'),
              //             ),
              //             Container(
              //               child: Text('bs=${widget.myList[index].company?.bs}'),
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   },),
            ),
          ],
        ),
      ),
    );;
  }
}
